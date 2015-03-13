From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Mar 2015 22:51:34 +0100
Subject: [Buildroot] [PATCH v7 2/3] python-cheetah: add host-package
 support
In-Reply-To: <1426235050-3482-2-git-send-email-gwenj@trabucayre.com>
References: <1426235050-3482-1-git-send-email-gwenj@trabucayre.com>
 <1426235050-3482-2-git-send-email-gwenj@trabucayre.com>
Message-ID: <20150313225134.66e12e42@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On Fri, 13 Mar 2015 09:24:09 +0100, Gwenhael Goavec-Merou wrote:

> diff --git a/package/python-cheetah/python-cheetah.mk b/package/python-cheetah/python-cheetah.mk
> index 08076b5..3155951 100644
> --- a/package/python-cheetah/python-cheetah.mk
> +++ b/package/python-cheetah/python-cheetah.mk
> @@ -9,5 +9,7 @@ PYTHON_CHEETAH_SOURCE = Cheetah-$(PYTHON_CHEETAH_VERSION).tar.gz
>  PYTHON_CHEETAH_SITE = http://pypi.python.org/packages/source/C/Cheetah
>  PYTHON_CHEETAH_LICENSE = MIT
>  PYTHON_CHEETAH_SETUP_TYPE = setuptools
> +HOST_PYTHON_CHEETAH_DEPENDENCIES = host-python-markdown

I've added a comment in the .mk file above this line to explain this
dependency (taken from your commit log), and applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
