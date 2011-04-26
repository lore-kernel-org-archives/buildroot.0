From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Apr 2011 22:43:54 +0200
Subject: [Buildroot] [PATCH 7/8] toolchain: make target gcc a working
	option
In-Reply-To: <1302712169-28385-7-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Wed, 13 Apr 2011 13:29:28 -0300")
References: <1302712169-28385-1-git-send-email-gustavo@zacarias.com.ar>
	<1302712169-28385-7-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87oc3s216d.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Make target gcc a more usable option.
 Gustavo> * Nuke duplicate libgcc_s*.so* in /usr/lib since it confuses target gcc
 Gustavo> * Copy *crt*.o files to the target system to unbreak gcc

Committed, thanks.

-- 
Bye, Peter Korsgaard
