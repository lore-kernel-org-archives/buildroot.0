From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 00:18:29 +0200
Subject: [Buildroot] Analysis of defconfig build failures
In-Reply-To: <87ftzf9v7u.fsf@dell.be.48ers.dk>
References: <20180812170138.0b51be07@windsurf>
 <87600bbg68.fsf@dell.be.48ers.dk>
 <20180815213421.08e0a3b6@windsurf>
 <87ftzf9v7u.fsf@dell.be.48ers.dk>
Message-ID: <20180816001829.3f7a1436@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Aug 2018 23:27:17 +0200, Peter Korsgaard wrote:

>  >> Perhaps we could backport the changes and add as patches for the
>  >> affected defconfigs?  
> 
>  > The problem is that it will still affect anyone doing a U-Boot build,
>  > outside of the defconfigs.  
> 
> Ok. Is this a new failure introduced by something we do
> wrong/differently in Buildroot, or just something that is broken by
> building with newer compilers?

I don't think it's related to building with new compilers. It's just
some U-Boot versions that are broken if libfdt headers are already
available in the include path.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
