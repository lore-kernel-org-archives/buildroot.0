From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Aug 2016 16:10:40 +0200
Subject: [Buildroot] [PATCH] package/weston: fix patch
In-Reply-To: <1471016539-23386-1-git-send-email-yann.morin.1998@free.fr>
References: <1471016539-23386-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160814161040.5dc2351b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Aug 2016 17:42:19 +0200, Yann E. MORIN wrote:
> The newly iontroduced patch was created against weston's master branch,
> but was not rebased correctly on top of the release we are using, hence
> it does not apply because files have been moved since the release.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/5fb/5fbfd26d05a0ccaf4a70a100a7499cedea83ce6f/
>     http://autobuild.buildroot.org/results/769/76976fbfc2162c2c671a52eafdad82df6d25a660/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  .../0002-libweston-compositor-rdp-fix-no-break-space-U-A0-U8-.patch | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
