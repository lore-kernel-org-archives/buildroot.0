From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Aug 2016 09:19:38 +0200
Subject: [Buildroot] [PATCH 06/16 v3] core: introduce a generated
	kconfig snippet
In-Reply-To: <87poosaa9d.fsf@dell.be.48ers.dk>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <e4930f24c2ca2291b55d122df292702136feb91e.1468750623.git.yann.morin.1998@free.fr>
 <20160827161601.2fd0e8f5@free-electrons.com>
 <87poosaa9d.fsf@dell.be.48ers.dk>
Message-ID: <20160829091938.11ed7ff7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 Aug 2016 22:50:22 +0200, Peter Korsgaard wrote:

>  > It's a bit crazy the complexity that we have just to allow our manual
>  > to have the list of all packages in Buildroot. I'm not even sure this
>  > section of the manual is that useful, to be honest. But oh well, that's
>  > supported today, so we have to continue support it.  
> 
> Why do we _HAVE_ to continue to support it?
> 
> If we don't find the complexity worth the added value (I personally
> don't, I think we could just ask people to look under package/ for the
> list of packages), then we should just remove it.

I wouldn't mind if we were to remove this. I think the original intent
was to give some "exposure" as to what is available in Buildroot, so
that people just skimming through our documentation can see the wide
variety of packages we have.

The other thing that I find quite complex for no super benefit is the
whole "doc-asciidoc" infrastructure, but that's another story.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
