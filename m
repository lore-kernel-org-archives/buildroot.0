From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Sep 2013 16:50:27 +0200
Subject: [Buildroot] SVN process started at make
In-Reply-To: <15AE5A936F5E3A42A9144E66875A0A8934DB3B@server1-derijp.CLB-Benelux.lokaal>
 (Ruud Commandeur's message of "Tue, 3 Sep 2013 16:37:44 +0200")
References: <15AE5A936F5E3A42A9144E66875A0A8934DB3B@server1-derijp.CLB-Benelux.lokaal>
Message-ID: <87sixm558s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ruud" == Ruud Commandeur <RCommandeur@clb.nl> writes:

 Ruud> Hi Everyone,
 Ruud> Since today, all my 'make' commands in the buildroot dir take a very
 Ruud> long time before they actually start doing something. It appears to be
 Ruud> that on each make command, an svn process is started, that takes 5-10%
 Ruud> CPU time for a couple of minutes. Once this process stops, the 'normal'
 Ruud> make actions start.

 Ruud> My sources have been under svn control for a long time by using
 Ruud> SmartSVN, but since today I installed the commandline tool of
 Ruud> subversion. This must have triggered this behaviour, but can anyone
 Ruud> explain to me how I can prevent this? Is this someting in the
 Ruud> Makefile(s)?

Odd. Would it be because of ./support/scripts/setlocalversion?

-- 
Bye, Peter Korsgaard
