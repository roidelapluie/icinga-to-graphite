## DEPRECATED

Icinga2 comes with way better integrations and these scripts are no longer relevant.



## README (2012)
This script sends the Nagios/Icinga perfdatas into Graphite.


# Nagios/Icinga configuration

Main config file:

    service_perfdata_file=/tmp/service-perfdata
    service_perfdata_file_processing_command=process-service-perfdata-file
    service_perfdata_file_template=[SERVICEPERFDATA]\t$TIMET$\t$HOSTNAME$\t$SERVICEDESC$\t$SERVICEEXECUTIONTIME$\t$SERVICELATENCY$\t$SERVICEOUTPUT$\t$SERVICEPERFDATA$
    service_perfdata_file_processing_interval=330

Example command:

    define command {
        command_line                   /usr/local/bin/transform_perfdata.sh /tmp/service-perfdata
        command_name                   process-service-perfdata-file
    }



* To view the datas in Graphite, I recommend to use the *"Graph options -> Line mode -> Connected line"* or the graphite function *keepLastValue()*.
* Keep in mind that some checks can use different unit: 5Mb, then 5Gb.





