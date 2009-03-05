From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 05 Mar 2009 12:03:25 +0100
Subject: [Buildroot] [PATCH] mDNSresponder bzero-memset
In-Reply-To: <206b9e70903031748p25a53383sc3464fd017a0884e@mail.gmail.com> (Zac
	Wheeler's message of "Tue\, 3 Mar 2009 17\:48\:15 -0800")
References: <206b9e70903031748p25a53383sc3464fd017a0884e@mail.gmail.com>
Message-ID: <87prgwfczm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Zac" == Zac Wheeler <zac.wheeler@gmail.com> writes:

 Zac> This patch adds a couple of package patches to fix mdnsresponder so
 Zac> that it uses memset instead of bzero.

The existing -bcopy.patch seems to fix up some bzero -> memset
already, wouldn't it make more sense to add these fixes to that patch
instead (and maybe rename it).

-- 
Bye, Peter Korsgaard
