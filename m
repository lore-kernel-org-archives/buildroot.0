From: Ezequiel Garcia <ezequiel@collabora.com>
Date: Sat, 15 Dec 2018 10:13:28 -0300
Subject: [Buildroot] [PATCH] ci20: Fix U-Boot build with codesourcery
 toolchain
In-Reply-To: <20181215140713.36feb22e@windsurf.home>
References: <20181112181928.26634-1-ezequiel@collabora.com>
 <20181215131434.212e1a95@windsurf.home>
 <33885b674cf1241c24d93e0bc6129f55c05577fd.camel@collabora.com>
 <20181215140713.36feb22e@windsurf.home>
Message-ID: <37b5a1d848af4a1e87464aa9dbdfbad846df61b6.camel@collabora.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2018-12-15 at 14:07 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 15 Dec 2018 09:45:33 -0300, Ezequiel Garcia wrote:
> 
> > This issue appears because the U-Boot used on this board is ancient.
> > 
> > So, only boards with ancient U-Boot will be affected. The right
> > fix would be to either update U-Boot, or move to mainline.
> 
> OK, indeed if newer U-Boot versions are not affected, then we're good.
> 

Yeah, git-log says U-Boot stopped setting the default endianness in 2014 :-)
