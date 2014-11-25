From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Nov 2014 20:25:00 +0100
Subject: [Buildroot] [PATCH next] package: add python-httplib2
In-Reply-To: <1416939103-18848-1-git-send-email-peter@korsgaard.com>
References: <1416939103-18848-1-git-send-email-peter@korsgaard.com>
Message-ID: <20141125202500.12884fa1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 25 Nov 2014 19:11:43 +0100, Peter Korsgaard wrote:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/Config.in                            |  1 +
>  package/python-httplib2/Config.in            | 11 +++++++++++
>  package/python-httplib2/python-httplib2.hash |  3 +++
>  package/python-httplib2/python-httplib2.mk   | 14 ++++++++++++++
>  4 files changed, 29 insertions(+)
>  create mode 100644 package/python-httplib2/Config.in
>  create mode 100644 package/python-httplib2/python-httplib2.hash
>  create mode 100644 package/python-httplib2/python-httplib2.mk

Thanks applied to next, after fixing the license (see below).

> +PYTHON_HTTPLIB2_VERSION = 0.9
> +PYTHON_HTTPLIB2_SOURCE = httplib2-$(PYTHON_HTTPLIB2_VERSION).tar.gz
> +PYTHON_HTTPLIB2_SITE = http://pypi.python.org/packages/source/h/httplib2
> +PYTHON_HTTPLIB2_SETUP_TYPE = setuptools
> +PYTHON_HTTPLIB2_LICENSE = BSD-3c
> +PYTHON_HTTPLIB2_LICENSE_FILES = PKG-INFO

The PKG-INFO file prominently indicates that the license is MIT, not
BSD-3c. And this seems to be confirmed in the individual source files.

Committed with this fixed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
