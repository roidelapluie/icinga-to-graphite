BEGIN {
    FS="\t"
}

# emptying the prefix for each line
prefix_string=""

$8 ~ /[0-9]/ {
    #Replace ponctuation marks
    gsub(/ /,"_",$3);
    gsub(/ /,"_",$4);
    gsub(/-/,"_",$3);
    gsub(/-/,"_",$4);
    gsub(/\./,"_",$3);
    gsub(/\./,"_",$4);



    split($8, perfdatas, " ");
    old_string="";

    # We want to trasform 'foo bar=5 bar foo=6' in:
    # foo_bar 5
    # bar_foo 6
    for (i=1; i<=length(perfdatas); i++)
    {
        # if the prefix is not empty, we add the current perfdata to it
        if (prefix_string != "")
        {
            perfdata=prefix_string "_" perfdatas [i]
        }
        else
        {
            perfdata=perfdatas[i]
        }
        # We check if the perfdata has =
        # because some check scripts are using 'foo bar=5 bar foo=6' as perfdatas
        if (perfdata ~ /=/)
        {

            name=gensub(/(.+)=.*/, "\\1", "g", perfdata)
                value=gensub(/[^=]*=([0-9.]+).*/, "\\1", "g", perfdata)
                if (value != perfdata){
                    # This is the actual value sent to graphite
                    print "monitoring.nagios."$3"."$4"."name" "value" "$2
                }
            # We found actual data, so we can empty the prefix string
            prefix_string=""
        }
        else
        {
            prefix_string=perfdata
        }
    }
}

