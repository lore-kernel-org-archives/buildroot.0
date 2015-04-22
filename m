From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 22:46:20 +0200
Subject: [Buildroot] [PATCH v2 1/1] gtest: update recipe to use autotools
In-Reply-To: <1429734568-20489-1-git-send-email-casantos@datacom.ind.br>
References: <CAHkwnC-cZpP5m5009NiLZM07+t8CFSYVxqTBmNuXEA-x9mGwLg@mail.gmail.com>
 <1429734568-20489-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20150422224620.7abefdb2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carlos Santos,

On Wed, 22 Apr 2015 17:29:28 -0300, Carlos Santos wrote:

> -$(eval $(cmake-package))
> +$(eval $(autotools-package))

I still don't understand. Fabio quoted the README of gtest, which says:

"""
The Autotools build script (configure + make) is no longer officially
supportted.  You are encouraged to migrate to your own build system or
use CMake.
"""

So why moving from using the supported CMake to the no-longer supported
autotools build system would be an improvement?

This really needs more explanations.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
