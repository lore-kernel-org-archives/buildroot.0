From: Ruud Commandeur <RCommandeur@clb.nl>
Date: Tue, 3 Sep 2013 16:37:44 +0200
Subject: [Buildroot] SVN process started at make
Message-ID: <15AE5A936F5E3A42A9144E66875A0A8934DB3B@server1-derijp.CLB-Benelux.lokaal>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Everyone,

Since today, all my 'make' commands in the buildroot dir take a very
long time before they actually start doing something. It appears to be
that on each make command, an svn process is started, that takes 5-10%
CPU time for a couple of minutes. Once this process stops, the 'normal'
make actions start.

My sources have been under svn control for a long time by using
SmartSVN, but since today I installed the commandline tool of
subversion. This must have triggered this behaviour, but can anyone
explain to me how I can prevent this? Is this someting in the
Makefile(s)?

Regards,

Ruud
