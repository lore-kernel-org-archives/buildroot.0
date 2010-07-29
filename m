From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 Jul 2010 17:34:25 +0200
Subject: [Buildroot] [PATCH] Migrate iostat to gentargets
In-Reply-To: <4C4868DE.1080805@zacarias.com.ar> (Gustavo Zacarias's message of
	"Thu, 22 Jul 2010 12:50:54 -0300")
References: <4C4868DE.1080805@zacarias.com.ar>
Message-ID: <87bp9qe1z2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Migrate iostat to gentargets.
 Gustavo> Also make the cpu counting routine more reliable (for ARM it's
 Gustavo> "Processor" in cpuinfo rather than "processor").

Committed, thanks.

-- 
Bye, Peter Korsgaard
