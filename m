From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 15:15:44 +0200
Subject: [Buildroot] [PATCH 0/3] core: remove lkegacy BR2_STRIP_none
In-Reply-To: <cover.1498913468.git.yann.morin.1998@free.fr>
References: <cover.1498913468.git.yann.morin.1998@free.fr>
Message-ID: <20170701151544.6b731e8c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  1 Jul 2017 14:51:16 +0200, Yann E. MORIN wrote:

> This is a legacy option that dates back to when we had support for three
> different kond of stripping: none, strip and sstrip.
> 
> We now have only strip or none, which is semantically just a boolean,
> rather than a choice.
> 
> But choices are not randomised, so having the stripping option a real
> boolean rather than a choice will allow us to test it in the
> autobuilders.

As discussed IRL, autobuilders use randpackageconfig, so such options
will not be randomized. But anyway, I think your changes make sense, so
I've applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
