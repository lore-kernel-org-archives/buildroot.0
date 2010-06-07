From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Jun 2010 23:17:59 +0200
Subject: [Buildroot] [PATCH] target skeleton definition
In-Reply-To: <20100607230541.5f2bf769@surf> (Thomas Petazzoni's message of
	"Mon, 7 Jun 2010 23:05:41 +0200")
References: <4c0d5b02.8c4bdf0a.5e33.ffff9c4e@mx.google.com>
	<20100607230541.5f2bf769@surf>
Message-ID: <87d3w2k0e0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello Dmytro,
 Thomas> On Mon, 7 Jun 2010 21:06:42 +0300
 Thomas> Dmytro Milinevskyy <milinevskyy@gmail.com> wrote:

 >> Here's the patch to give posibility to redefine path to the rootfs
 >> skeleton. Also this patch moves default and busybox skeleton trees
 >> into fs/skeleton dir.

 Thomas> Thanks for this patch. In general, this is something I intended to do,
 Thomas> so it's great to see patches implementing this.

 Thomas> Personaly, I'd prefer if we could get rid of the "busybox" skeleton
 Thomas> altogether. I think Peter Korsgaard agreed with this decision, but I'll
 Thomas> let him restate his preference here.

Yes, I think now would be a good moment to cleanup this stuff.

 Thomas> If Peter agrees, then the skeleton could be moved to just fs/skeleton/.

-- 
Bye, Peter Korsgaard
