From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Thu, 19 Nov 2015 19:03:02 +0900
Subject: [Buildroot] [PATCH] package/gauche: fix build error on
 BR2_STATIC_LIBS
In-Reply-To: Your message of Wed, 18 Nov 2015 21:58:00 +0100.
 <20151118215800.47e61d75@free-electrons.com>
Message-ID: <201511191003.tAJA32Zo005876@ms-omx02.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas.

Thank you for applying.
Sorry for conflicts patch.

I will send v2 patch (diff from master) as your request next.

Regards,
Kawashima

Thomas Petazzoni writes:
> Dear Hiroshi Kawashima,
> 
> On Wed, 18 Nov 2015 18:30:23 +0900, Hiroshi Kawashima wrote:
> > Building gauche depends on dynamic link, so add dependency on
> > !BR2_STATIC_LIBS.
> > 
> > Fix:
> > http://autobuild.buildroot.org/results/da5/da5b9605552d4914c5e6f0d890367b92
> 536419c1
> > 
> > Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
> > ---
> >  package/gauche/Config.in | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> Applied to master, thanks. However, your patch didn't apply properly, I
> had to fix up some conflicts. If possible, please try to send patches
> that apply on top of the latest master.
> 
> Thanks!
> 
> Thomas
============================================================
    Hiroshi Kawashima
