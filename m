From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Sep 2015 22:19:04 +0200
Subject: [Buildroot] [PATCH] mplayer: enable building on ARM64
In-Reply-To: <b4065180404deb324af702186c37e497bc1740b8.1442402281.git.jpinto@synopsys.com>
References: <b4065180404deb324af702186c37e497bc1740b8.1442402281.git.jpinto@synopsys.com>
Message-ID: <20150916221904.6f41f160@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Sep 2015 12:24:41 +0100, jpinto wrote:
> 
> Signed-off-by: Joao Pinto <jpinto@synopsys.com>
> ---
>  0007-mplayer-enable-aarch64.patch | 20 ++++++++++++++++++++
>  Config.in                         |  2 +-

I am not sure how you generated your patch, but it is incorrect: it's
touching Config.in and 0007-mplayer-enable-aarch64.patch in the root
directory of the Buildroot sources, while it should be touching files
in package/mplayer/.

If you just do a git commit, and then use git format-patch, I don't
really see how you can end up generating such an invalid patch.

How did you generate your patch?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
