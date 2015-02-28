From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Feb 2015 19:00:21 +0100
Subject: [Buildroot] [PATCH v2 1/7] directfb: bump version to 1.7.7 and
 add hash
In-Reply-To: <20150228113710.181c6331@free-electrons.com>
References: <1425075952-24699-1-git-send-email-ps.report@gmx.net>
 <20150228113710.181c6331@free-electrons.com>
Message-ID: <20150228190021.5cb598e5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Feb 2015 11:37:10 +0100, Thomas Petazzoni wrote:

> I already had a series to bump DirectFB, but I never finished testing
> it, so I never submitted it. I think my series has some more cleanups
> than your series. Do you mind if I push my series somewhere so you can
> have a look, and maybe pick up some additional things?

I've pushed my patch series at:

  http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=directfb-bump

The list of commits is (in reverse order) :

directfb-examples: bump to 1.7.0, add hash file
directfb-examples: do not install to staging
directfb-examples: remove options for each example
linux-fusion: use a more traditional style to define LINUX_FUSION_MAKE_OPTS
linux-fusion: bump to 9.0.3, use .tar.xz and add hash file
sawman: remove package
divine: remove package
directfb: add options for divine and sawman
directfb: remove BR2_PACKAGE_DIRECTFB_DEBUG option
directfb: remove BR2_PACKAGE_DIRECTFB_UNIQUE option
directfb: remove broken X.org support
directfb: add hash file
directfb: bump to 1.7.6
directfb: rename patches to the new naming convention

How shall we proceed to merge both of our series together? Are you
willing to take care of this?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
