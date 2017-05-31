From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 09:28:43 +0200
Subject: [Buildroot] [PATCH 14/16] erlang-p1-oauth: New package
In-Reply-To: <20170530230314.GN2009@localhost>
References: <20170530145211.15320-1-johan.oudinet@gmail.com>
 <20170530145211.15320-15-johan.oudinet@gmail.com>
 <20170531000857.331cee23@free-electrons.com>
 <20170530230314.GN2009@localhost>
Message-ID: <20170531092843.10015bf7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 May 2017 01:03:14 +0200, Christophe Romain wrote:

> >> +ERLANG_P1_OAUTH_VERSION = 0.6.1
> >> +ERLANG_P1_OAUTH_SITE = $(call github,processone,p1_oauth,$(ERLANG_P1_OAUTH_VERSION))  
> >
> >But I don't see how this URL (which is different) can actually work.
> >Isn't there a typo here?  
> 
> oups, there is indeed a typo from me.
> repository is p1_oauth2 of course

OK.

> >Should the package be named erlang-p1-oauth2 instead ?  
> 
> I don't know what's your packaging naming convention.
> rename is not mandatory from what i understand, but can make sense.
> up to you guys.

There is no "rename" involved since it's a new package. We generally
prefer to use the upstream package name, so erlang-p1-oauth2 seems
better here.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
