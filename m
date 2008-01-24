From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Jan 2008 10:25:28 +0100
Subject: [Buildroot] svn co fail
In-Reply-To: <867591.57120.qm@web32407.mail.mud.yahoo.com> (shlomo Tzidkani's
	message of "Wed\, 23 Jan 2008 23\:07\:14 -0800 \(PST\)")
References: <867591.57120.qm@web32407.mail.mud.yahoo.com>
Message-ID: <87myqvefsn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "shlomo" == shlomo Tzidkani <shlomotz1@yahoo.com> writes:

Hi,

 shlomo> Hello,
 shlomo> browse the buildroot site (http://buildroot.uclibc.org/cgi-bin/viewcvs.cgi/
 shlomo> trunk/buildroot/)
 shlomo> works fine .
 shlomo> But, the svn checkout is fail with  the following error :

 shlomo> [st]$ svn checkout  svn://uclibc.org/trunk/buildroot
 shlomo> svn: Can't connect to host 'uclibc.org': Connection timed out

Probably a firewall issue on your end. Is port 3690 blocked?

Try telnet uclibc.org svn, and you should get something like:
Trying 140.211.166.42...
Connected to uclibc.org.
Escape character is '^]'.
( success ( 1 2 ( ANONYMOUS ) ( edit-pipeline svndiff1 absent-entries ) ) )

-- 
Bye, Peter Korsgaard
