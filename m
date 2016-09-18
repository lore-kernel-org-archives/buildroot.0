From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 20:21:47 +0200
Subject: [Buildroot] [PATCH 02/11] Add Linux Kernel stable 4.4.16 patch
 file for Arietta G25
In-Reply-To: <20160918200207.75421760@free-electrons.com>
References: <1470827167-9426-1-git-send-email-biagio.hkr@gmail.com>
 <1470827167-9426-4-git-send-email-biagio.hkr@gmail.com>
 <20160918200207.75421760@free-electrons.com>
Message-ID: <20160918202147.077395c7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Sep 2016 20:02:07 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 10 Aug 2016 13:05:58 +0200, Biagio Montaruli wrote:
> > Signed-off-by: Biagio Montaruli <biagio.hkr@gmail.com>
> > ---
> >  .../patches/linux/linux-4.4.16-arietta.patch       | 409 +++++++++++++++++++++
> >  1 file changed, 409 insertions(+)
> >  create mode 100644 board/acmesystems/arietta-g25/patches/linux/linux-4.4.16-arietta.patch  
> 
> Is there a good motivation to use the 4.4 kernel that requires some
> patches to support the Arietta, as opposed to using the mainline kernel
> which has support for this platform built-in?
> 
> Also, if you really insist in using the 4.4 kernel, in PATCH 05/11,
> you're making the defconfig point to your own Github repository for the
> kernel. Why don't you include the necessary patches in your Github
> repository, then?

After looking more carefully: it's for at91bootstrap3 that you are
using your own Github repository. For the kernel you are using
mainline. So what about using the latest mainline, which has support
for the Arietta and Aria platforms, without the need for patches?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
