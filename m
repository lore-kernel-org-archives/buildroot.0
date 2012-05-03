From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 03 May 2012 15:54:46 +0200
Subject: [Buildroot] [PATCH] toolchain/uClibc: enable
	UCLIBC_SUPPORT_AI_ADDRCONFIG
In-Reply-To: <1335965607-1377-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 2 May 2012 10:33:27 -0300")
References: <1335965607-1377-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ipgd1iah.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Enable AI_ADDRCONFIG support in uClibc otherwise we don't get
 Gustavo> the ifaddrs.h header installed and thus lack getifaddrs
 Gustavo> support.  Quite useful for samba for example so we can use
 Gustavo> interfaces=eth0 statements in the configuration file rather
 Gustavo> than klunkier interfaces=192.168.1.1/255.255.255.0 ones.

Committed, thanks.

-- 
Bye, Peter Korsgaard
