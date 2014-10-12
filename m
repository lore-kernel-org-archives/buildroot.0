From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 13:02:12 +0200
Subject: [Buildroot] [PATCH 1/2] package/sysvinit: don't start logging
In-Reply-To: <1412779165-13366-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 8 Oct 2014 11:39:24 -0300")
References: <1412779165-13366-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87egudzh3f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Don't try to start logging from /etc/inittab because busybox installs a
 > S01logging script that handles that and can lead to duplicate logging
 > processes.
 > Let's handle the logging in each package that provides it since we can
 > get multiple variants in the future like syslog-ng that have different
 > initialization routines.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
