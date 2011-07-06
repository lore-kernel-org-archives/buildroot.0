From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Jul 2011 07:17:39 +0200
Subject: [Buildroot] Statically linked binary segfaults
In-Reply-To: <4DF29DA5.4080900@free.fr> (Damien Bally's message of "Sat, 11
 Jun 2011 00:41:41 +0200")
References: <4DF29DA5.4080900@free.fr>
Message-ID: <87fwmkugwc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Damien" == Damien Bally <biribi@free.fr> writes:

 Damien> Hello
 Damien> mc2xml segfaults in buildroot (target = i686). The binary is available
 Damien> for download here (no source) : http://mc2xml.ueuo.com/

 Damien> By the same time, it works perfectly in a distribution made from
 Damien> scratch with crosstool-ng.

 Damien> I tried to use the crosstool-ng as external environment with buildroot
 Damien> with no change. The kernel binary was the same for testing.

Hard to know without knowing how mc2xml is built and what buildroot
configuration you have used. Perhaps you could enable strace and see
where it crashes?

-- 
Bye, Peter Korsgaard
