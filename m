From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 7 Oct 2009 18:41:59 +0200
Subject: [Buildroot] 2009.05-rc1: fix rsync build with config cache
In-Reply-To: <20090506122033.1c849569@bandomeer.europe.flane.local>
References: <20090506122033.1c849569@bandomeer.europe.flane.local>
Message-ID: <20091007164159.GA12100@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 06, 2009 at 12:20:33PM +0200, Olaf Rempel wrote:
>Hi,
>
>building rsync (x86 target) fails with config cache turned on
>(at least with my attached .config).
>
>With config cache during .configure:
>checking for struct addrinfo... yes
>checking for struct sockaddr_storage... (cached) no

which package did set this to no?

Please retest.
TIA,
