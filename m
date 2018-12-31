From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 15:35:05 +0100
Subject: [Buildroot] [PATCH 1/2] package/python3-setuptools: new package
In-Reply-To: <CALFsTFUXOqqGEUfFuT62jD=7xJVCg09wk6BNf0mAi_dFZ+_cGw@mail.gmail.com>
References: <1546152095-4439-1-git-send-email-james.hilliard1@gmail.com>
 <20181230121932.39e696f9@windsurf>
 <CADvTj4qinyrbrutcb_WkO4rveJgA9i9F6bX9Txhp+MAWxZSyfg@mail.gmail.com>
 <20181230142407.69d10ba8@windsurf>
 <CALFsTFUXOqqGEUfFuT62jD=7xJVCg09wk6BNf0mAi_dFZ+_cGw@mail.gmail.com>
Message-ID: <20181231153505.62460694@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Yegor in Cc.

On Sun, 30 Dec 2018 20:15:17 +0200, Asaf Kahlon wrote:

> I don't heavily use the meson build system, but after looking at the
> history of setup.py in the official repository,
> I found the commit which made the change. At the commit message they
> stated that:
> "This gives us a consistent experience and a simpler setup across all
> operating systems. Setuptools is available everywhere these days."
> The change is relevant since 0.48.

Indeed, upstream commit 86298f2109d215ad6b26d3462af7b685d52d0dd7 drops
the fallback on distutils, and only setuptools is supported now. This
makes my patch series introducing python3-setuptools even more relevant
then. I would like to see a review from Yegor on this series first, as
he has lots of background in the Python integration in Buildroot.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
