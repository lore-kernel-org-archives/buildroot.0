From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 22:33:35 +0200
Subject: [Buildroot] [PATCH 1/1] Fix ncurses gcc-5.0 compile issue (for
 real)
In-Reply-To: <1437679186-15114-1-git-send-email-bas@bmail.ru>
References: <1437679186-15114-1-git-send-email-bas@bmail.ru>
Message-ID: <20150723223335.60374492@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear kyak,

On Thu, 23 Jul 2015 22:19:46 +0300, kyak wrote:
> The previous patch didn't work in all cases. The new patch is taken from
> upstream:
> 
> http://ncurses.scripts.mit.edu/?p=ncurses.git;a=blobdiff;f=ncurses/base/MKlib_gen.sh;h=b91398c740a266f10edbbce19f19c52b9709556f;hp=d8cc3c9751faa157d0c8cb8e16fbe4217703966b;hb=97bb4678dc03e753290b39bbff30ba2825df9517;hpb=762520a7930d7f698d542628d3c04bc201f7dac2
> Signed-off-by: kyak <bas@bmail.ru>

We need a real name for Signed-off-by / Author. Can you fix this?

Also:

 * There should be one empty line before the Signed-off-by line.

 * The title should be "<package>: <description>", so: "ncurses: fix
   gcc 5 compile issue for real" (saying 5.0 is incorrect since there
   has never really been a gcc 5.0, the first stable release was 5.1).

 * Can you include the upstream patch reference in the patch
   description itself, and Signed-off-by the patch itself as well? See
   http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches
   for more details.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
