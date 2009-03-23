From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 23 Mar 2009 10:46:09 +0100
Subject: [Buildroot] svn commit: [25775] trunk/buildroot/target/generic:
	target_busybox_skeleton/etc target_skel etc...
In-Reply-To: <d6a0e5a20903221839o5275f3eakc9b506bfde9f9174@mail.gmail.com>
	(Hiroshi Shinji's message of "Mon\, 23 Mar 2009 10\:39\:56 +0900")
References: <20090320215943.DCCB87656C@busybox.osuosl.org>
	<d6a0e5a20903221839o5275f3eakc9b506bfde9f9174@mail.gmail.com>
Message-ID: <87mybclggu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hiroshi" == Hiroshi Shinji <hiroshi.shinji@gmail.com> writes:

 Hiroshi> Hi,
 >> +choice
 >> +       prompt "Serial port to run a getty on"
 >> +       default BR2_TARGET_GENERIC_GETTY_TTYSO
 >> +       help
 >> +         Select a port to run a getty (login prompt) on.
 >> +
 >> +config BR2_TARGET_GENERIC_GETTY_NONE
 >> +       bool "none"
 >> +config BR2_TARGET_GENERIC_GETTY_TTYSO

 Hiroshi> The last character of "BR2_TARGET_GENERIC_GETTY_TTYSO" is not "0"(zero).
 Hiroshi> Please fix it.

Ahh yes, thanks - Fixed in r25791.

-- 
Bye, Peter Korsgaard
