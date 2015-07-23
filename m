From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Jul 2015 16:27:13 -0300
Subject: [Buildroot] [PATCH 1/1] Fix ncurses gcc-5.0 compile issue (for
 real)
In-Reply-To: <1437679186-15114-1-git-send-email-bas@bmail.ru>
References: <1437679186-15114-1-git-send-email-bas@bmail.ru>
Message-ID: <55B14011.7060800@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/07/15 16:19, kyak wrote:

> The previous patch didn't work in all cases. The new patch is taken from
> upstream:
>
> http://ncurses.scripts.mit.edu/?p=ncurses.git;a=blobdiff;f=ncurses/base/MKlib_gen.sh;h=b91398c740a266f10edbbce19f19c52b9709556f;hp=d8cc3c9751faa157d0c8cb8e16fbe4217703966b;hb=97bb4678dc03e753290b39bbff30ba2825df9517;hpb=762520a7930d7f698d542628d3c04bc201f7dac2
> Signed-off-by: kyak <bas@bmail.ru>

Thanks, i've just hit this issue minutes ago, nice timing.

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

(x86_64 gcc 5.2.0 and blackfin 4.3.5)
Regards.
