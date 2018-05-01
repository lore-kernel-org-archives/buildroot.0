From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 May 2018 08:54:11 +0200
Subject: [Buildroot] [PATCH 1/2] syslog-ng: bump version header in conf
 file to 3.10
In-Reply-To: <20180419191418.28285-1-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Thu, 19 Apr 2018 16:14:17 -0300")
References: <20180419191418.28285-1-ricardo.martincoski@gmail.com>
Message-ID: <87wownn9ws.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
 > Remove a runtime warning message about configuration file being too old.

 > Do the same as commit 3dad25466d "syslog-ng: Bump version header in conf
 > file to 3.9". Package version of syslog-ng is 3.10.1, so bump version
 > number in syslog-ng.conf to 3.10.

 > Also add a comment to avoid the same warning message reappears when the
 > package is bumped.

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
 > Cc: Chris Packham <judge.packham@gmail.com>
 > ---
 > Wrapped version of the warning message that shows at every boot:
 >   Starting syslog-ng daemon: WARNING: Configuration file format is too
 >   old, syslog-ng is running in compatibility mode Please update it to
 >   use the syslog-ng 3.10 format at your time of convenience,
 >   compatibility mode can operate less efficiently in some cases. To
 >   upgrade the configuration, please review the warnings about
 >   incompatible changes printed by syslog-ng, and once completed change
 >   the @version header at the top of the configuration file.;

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
