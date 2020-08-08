From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 23:44:48 +0200
Subject: [Buildroot] [PATCH 1/2] package/python3-cython: new package
In-Reply-To: <20200728092657.2354762-1-fontaine.fabrice@gmail.com>
References: <20200728092657.2354762-1-fontaine.fabrice@gmail.com>
Message-ID: <20200808234448.7d1903e7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 28 Jul 2020 11:26:56 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> The host-setools package needs to be built for the host-python3, even
> when the target Python is not necessarily Python 3.x. Since it depends
> on host-python-cython, we need a Python 3 variant of it, which this
> patch introduces.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-cython/python-cython.mk     |  1 +
>  package/python3-cython/python3-cython.hash |  1 +
>  package/python3-cython/python3-cython.mk   | 16 ++++++++++++++++
>  3 files changed, 18 insertions(+)
>  create mode 120000 package/python3-cython/python3-cython.hash
>  create mode 100644 package/python3-cython/python3-cython.mk

Both patches applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
