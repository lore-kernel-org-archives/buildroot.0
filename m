From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Nov 2020 17:47:04 +0100
Subject: [Buildroot] [PATCH] package/python-remi: downgrade to 2020.8.6
 and move to pypi
In-Reply-To: <20201104141303.2124172-1-gwenj@trabucayre.com>
References: <20201104141303.2124172-1-gwenj@trabucayre.com>
Message-ID: <20201104174704.21d49585@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 Nov 2020 15:13:03 +0100
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Since
> https://github.com/dddomodossola/remi/commit/481ee7ca3df55be127db35560978a36997a2c088
> 
> remi use setuptools-scm to obtain version, but .git directory is dropped when
> the archive is fetched. The result is a build failure like:

Do we need to do more than reverting
d58a2267a61c1377e390aa132850d6098917cf88 ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
