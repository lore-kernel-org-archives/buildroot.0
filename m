From: =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAINCT0LvRg9GF0L7Qsg==?= <alexandrgluhov@mail.ru>
Date: Wed, 29 Oct 2014 15:46:04 +0300
Subject: [Buildroot] =?utf-8?q?postgreSQL_in_buildroot?=
Message-ID: <1414586764.228504684@f411.i.mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello, I'm using Buildroot for building Linux on my one-boarded computer on the base of freescale i.mx28. And I select postgresql in make menuconfig window. Now I want to configure postgresql, I mean, I want to set database destination, name, username and password, port and create tables in database but I don't know how to do it. And I have not enough experience in it. I tried search config files and tried run initdb and createdb on i.mx28, but unsuccessfully. When I run the i.mx, I get the following messages:
?
Initializing postgresql data base...
The files belonging to this database system will be owned by user "postgres".
This user must also own the server process.
?
?
The database cluster will be initialized with locale "C".
The default database encoding has accordingly been set to "SQL_ASCII".
The default text search configuration will be set to "english".
?
?
Data page checksums are disabled.
?
?
fixing permissions on existing directory /var/lib/pgsql ... ok
creating subdirectories ... ok
selecting default max_connections ... 100
selecting default shared_buffers ... 64MB
creating configuration files ... ok
creating template1 database in /var/lib/pgsql/base/1 ... ok
initializing pg_authid ... ok
initializing dependencies ... ok
creating system views ... ok
loading system objects' descriptions ... ok
creating collations ... sh: locale: not found
ok
No usable system locales were found.
Use the option "--debug" to see details.
creating conversions ... ok
creating dictionaries ... ok
setting privileges on built-in objects ... ok
creating information schema ... ok
loading PL/pgSQL server-side language ... ok
vacuuming database template1 ... ok
copying template1 to template0 ... ok
copying template1 to postgres ... ok
syncing data to disk ... ok
?
?
WARNING: enabling "trust" authentication for local connections
You can change this by editing pg_hba.conf or using the option -A, or
--auth-local and --auth-host, the next time you run initdb.
?
?
Success. You can now start the database server using:
?
?
??? /usr/bin/postgres -D /var/lib/pgsql
or
??? /usr/bin/pg_ctl -D /var/lib/pgsql -l logfile start
?
?
done
Starting postgresql: server starting
OK
?
So, it seems, that postgreSQL works, and create database template with user postgres.
I already read documentation, but I still have this problem.
So, could you help me, or advise something, because I have not enough experience to do it by myself.?

With best regards,
Alexandr Glukhov
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141029/c6b9c2d0/attachment.html>
