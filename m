From: Jaap Crezee <jaap@jcz.nl>
Date: Fri, 24 Jul 2015 15:05:58 +0200
Subject: [Buildroot] [PATCH 1/1] ncurses: fix gcc 5 compile issue for
	real
In-Reply-To: <1437742843-26270-1-git-send-email-bas@bmail.ru>
References: <1437742843-26270-1-git-send-email-bas@bmail.ru>
Message-ID: <55B23836.8010107@jcz.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/24/15 15:00, kyak wrote:
> The previous patch didn't work in all cases. The new patch is taken from
> upstream: http://ncurses.scripts.mit.edu/?p=ncurses.git;a=commit;h=97bb4678dc03e753290b39bbff30ba2825df9517
> 
> Fetch from: http://ncurses.scripts.mit.edu/?p=ncurses.git;a=blobdiff;f=ncurses/base/MKlib_gen.sh;h=b91398c740a266f10edbbce19f19c52b9709556f;hp=d8cc3c9751faa157d0c8cb8e16fbe4217703966b;hb=97bb4678dc03e753290b39bbff30ba2825df9517;hpb=762520a7930d7f698d542628d3c04bc201f7dac2
> 
> Signed-off-by: Thomas E. Dickey <dickey@invisible-island.net>
> Signed-off-by: Mikhail Peselnik <bas@bmail.ru>

<snip>

Acked-by: Jaap Crezee <jaap@jcz.nl>
Tested-by: Jaap Crezee <jaap@jcz.nl>

regards,


Jaap
