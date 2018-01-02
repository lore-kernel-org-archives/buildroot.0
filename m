From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Jan 2018 21:58:34 +0100
Subject: [Buildroot] [PATCH 1/2] package/zisofs_tools: new package
In-Reply-To: <00e4aeb9db64cb141c15a9fff0f3be4903504af6.1514923441.git.yann.morin.1998@free.fr>
References: <cover.1514923441.git.yann.morin.1998@free.fr>
 <00e4aeb9db64cb141c15a9fff0f3be4903504af6.1514923441.git.yann.morin.1998@free.fr>
Message-ID: <20180102215834.2b3f83c7@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 Jan 2018 21:04:11 +0100, Yann E. MORIN wrote:
> To support transparent (de)compression in iso9660, we need mkzftree,
> which comes from zisofs_tools, biundled with cdrkit.
> 
> However, cdrkit is a cmake package, but zisofs_tools is an autotools
> package, so we need a separate package just to get mkzftree, but it is
> pretty lightweight.
> 
> We just need the host variant for now,so we just add that.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I've renamed to zisofs-tools (we more commonly use - as a separator,
and indeed your comment header in the .mk file was using this name!),
added an entry to the DEVELOPERS file, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
