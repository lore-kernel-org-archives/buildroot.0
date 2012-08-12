From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Aug 2012 17:27:26 +0200
Subject: [Buildroot] [PATCH] python: fix interpreter directive for
 python scripts
In-Reply-To: <201208121650.03902.yann.morin.1998@free.fr>
References: <1344665427-27181-2-git-send-email-net147@gmail.com>
 <50279BDA.6080407@gmail.com>
 <CAMkyJgAgra7W+7-NZyT_Oz9HAHLGMgziLBU+kR-hdjexJsHtow@mail.gmail.com>
 <201208121650.03902.yann.morin.1998@free.fr>
Message-ID: <20120812172726.5111b4ef@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 12 Aug 2012 16:50:03 +0200,
"Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :

> Or introduce a new package infrastrucutre, like for autotools-based and
> cmake-based packages. For example, we could add a "pysetup" (or whatver)
> infrastructure:
> 
>   $(eval $(pysetup-package))
> 
> Which would automatically call ./setup in the package directory, passing the
> proper arguments, instead of reimplementing that in every python packages?

Right. We start to have more and more Python-based packages, and it
seems like those using the Python setuptools could benefit from having
a common infrastructure.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
