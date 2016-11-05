From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 14:55:43 +0100
Subject: [Buildroot] [PATCH 3/3] snowball-{hdmiservice,
 init}: remove packages
In-Reply-To: <1d4b32b4-f3a9-9349-18dc-ddea93d8a52c@mind.be>
References: <1478352758-28778-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1478352758-28778-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <1d4b32b4-f3a9-9349-18dc-ddea93d8a52c@mind.be>
Message-ID: <20161105145543.798906f8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 5 Nov 2016 14:48:16 +0100, Arnout Vandecappelle wrote:

> > +config BR2_PACKAGE_SNOWBALL_HDMISERVICE
> > +	bool "snowball-hdmiservice removed"
> > +	select BR2_LEGACY
> > +	help
> > +	  We no longer have support for the Snowball platform in
> > +	  Buildroot, so this package was no longer useful.  
> 
>  ... explain that here:
> 
> 	  If you need this package, get it from the buildroot-2016.08
> 	  tarball and put it in a BR2_EXTERNAL tree. You need to give the
> 	  package a different name however.
> 
>  Hm, that last bit makes it a bit complicated so perhaps adding such limited
> information to the help text doesn't help a lot...

Well, we would have to add this message to pretty much each and every
package being removed from Buildroot, so I find it rather pointless to
have it specifically for those packages.

I'm pretty sure nobody uses Buildroot anymore for Snowball related
stuff. The igloocommunity.org domain name is for sale, and it's really
only because the source code is hosted on Github that it still survives.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
