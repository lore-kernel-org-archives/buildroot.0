From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 00:10:27 +0100
Subject: [Buildroot] [PATCH v4 14/17] python-wsaccel: new package
In-Reply-To: <1454799603-5474-15-git-send-email-mc5686@mclink.it>
References: <1454799603-5474-1-git-send-email-mc5686@mclink.it>
 <1454799603-5474-15-git-send-email-mc5686@mclink.it>
Message-ID: <20160220001027.0f00fc52@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mauro Condarelli,

On Sun,  7 Feb 2016 00:00:00 +0100, Mauro Condarelli wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>

I've applied to next, though I have one request (see below).

> +PYTHON_WSACCEL_VERSION = 0.6.2
> +PYTHON_WSACCEL_SOURCE = wsaccel-$(PYTHON_WSACCEL_VERSION).tar.gz
> +PYTHON_WSACCEL_SITE = http://pypi.python.org/packages/source/w/wsaccel
> +PYTHON_WSACCEL_LICENSE = Apache-2.0

It is really annoying that there is no proper license information in
this tarball. After the 0.6.2 release, the upstream project has added a
proper LICENSE file (see
https://github.com/methane/wsaccel/commit/71e963bd5f49b91a7d95d0004de64ce5b935cc25).
It would be good to ask upstream to make a 0.6.3 release, published on
PyPi, which we could use and therefore reference the LICENSE file.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
