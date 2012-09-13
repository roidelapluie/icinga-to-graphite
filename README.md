This scripts sends the Nagios perfdatas into Graphite.


# Nagios/Icinga configuration

    service_perfdata_file=/tmp/service-perfdata
    service_perfdata_file_processing_command=process-service-perfdata-file
    service_perfdata_file_template=[SERVICEPERFDATA]\t$TIMET$\t$HOSTNAME$\t$SERVICEDESC$\t$SERVICEEXECUTIONTIME$\t$SERVICELATENCY$\t$SERVICEOUTPUT$\t$SERVICEPERFDATA$
    service_perfdata_file_processing_interval=330

    define command {
        command_line                   /usr/local/bin/transform_perfdata.sh /tmp/service-perfdata
        command_name                   process-service-perfdata-file
    }






