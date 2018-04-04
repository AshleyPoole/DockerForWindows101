#escape=`

FROM microsoft/mssql-server-windows-developer

COPY . .

ENV attach_dbs "[{'dbName':'MusicStore','dbFiles':['C:\\MusicStore.mdf','C:\\MusicStore_log.ldf']}]"