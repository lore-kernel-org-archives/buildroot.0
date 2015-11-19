From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Nov 2015 22:18:02 +0100
Subject: [Buildroot] [PATCH v2] package/gauche: fix build error on
 BR2_STATIC_LIBS
In-Reply-To: <201511191003.tAJA3feM021882@ms-omx03.plus.so-net.ne.jp>
References: <201511191003.tAJA3feM021882@ms-omx03.plus.so-net.ne.jp>
Message-ID: <20151119221802.415cdc2c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hiroshi Kawashima,

On Thu, 19 Nov 2015 19:03:41 +0900, Hiroshi Kawashima wrote:
> Building gauche depends on dynamic link, so add dependency on
> !BR2_STATIC_LIBS.
> 
> Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>

Thanks for this new version, but it was unnecessary. It seems like we
misunderstood each other. In my reply to your previous version of this
patch I said:

  Applied to master, thanks. However, your patch didn't apply properly,
  I had to fix up some conflicts. If possible, please try to send
  patches that apply on top of the latest master.

So I did say it was applied to master, and only asked you, for your
*next* contributions, to make sure that they apply on top of master.

See:
http://git.buildroot.net/buildroot/commit/?id=e9b415ace06b416a5743c97e13f4fd7df9666d85.
Your patch has already been applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
