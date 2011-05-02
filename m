From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 May 2011 17:45:13 +0200
Subject: [Buildroot] [PATCH] net-snmp: fixup paths in net-snmp-config
In-Reply-To: <1304350565-1948-1-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Mon, 2 May 2011 12:36:05 -0300")
References: <1304350565-1948-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87wri9t8c6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Exposed by commit 7e3e8ec040b06d6e2fb69e55c004f1ebc02c76d0
 Gustavo> net-snmp-config goes for -L/usr/lib thus things break since this wins
 Gustavo> over the sysroot if we have a host net-snmp library around when we build
 Gustavo> packages that link against net-snmp.

Committed, thanks.

-- 
Bye, Peter Korsgaard
