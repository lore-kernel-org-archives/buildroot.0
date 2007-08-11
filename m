From: Brad House <brad@mainstreetsoftworks.com>
Date: Sat, 11 Aug 2007 09:19:04 -0400
Subject: [Buildroot] [patch] add mdnsresponder package
In-Reply-To: <46BA66E3.7010407@mainstreetsoftworks.com>
References: <46BA66E3.7010407@mainstreetsoftworks.com>
Message-ID: <46BDB748.9060602@mainstreetsoftworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Any word on getting this patch committed?  Thanks.

-Brad

Brad House wrote:
> mDNSResponder is a component of Bonjour, Apple's initiative for
> zero-configuration networking.  More information is available
> here:
> 
> http://developer.apple.com/networking/bonjour/index.html
> 
> This appears to be lighter-weight than avahi and has basically
> no dependencies other than uclibc itself.  The avahi package
> needed some patches to even compile then crashed when I tried
> to run it.  I'd prefer to use something smaller anyhow, and
> this appears to fit the bill quite well...
> 
> The patch below adds support to buildroot for mdnsresponder,
> including the config file template and initialization script.
> 
> -Brad
> 
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
