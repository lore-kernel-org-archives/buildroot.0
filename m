From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Oct 2017 10:19:54 +0200
Subject: [Buildroot] [PATCH 07/12] go: bump version to 1.9
In-Reply-To: <20171019002257.27646-7-christian@paral.in>
References: <20171019002257.27646-1-christian@paral.in>
 <20171019002257.27646-7-christian@paral.in>
Message-ID: <20171019101954.185b29f2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Oct 2017 20:22:52 -0400, Christian Stewart wrote:
> Bumping Go to 1.9 from 1.7.
> 
> Go 1.8 comes with significant performance improvements, particularly
> around ARM: "CPU time required by our benchmark programs was reduced by
> 20-30% on 32-bit ARM systems."
> 
> Go 1.9 is required for docker-engine and other Go packages in Buildroot.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

Since you're bumping go, it would be nice if you could review/test:

  https://patchwork.ozlabs.org/patch/826431/
  https://patchwork.ozlabs.org/patch/826433/
  https://patchwork.ozlabs.org/patch/826432/
  https://patchwork.ozlabs.org/patch/826434/

And specifically the first one.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
