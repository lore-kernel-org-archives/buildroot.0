From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 18:15:39 +0100
Subject: [Buildroot] [PATCH next v2] python-certifi: add new package
In-Reply-To: <1416649560-3561-1-git-send-email-yegorslists@googlemail.com>
References: <1416649560-3561-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20141122181539.38f2a5db@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Sat, 22 Nov 2014 10:46:00 +0100, Yegor Yefremov wrote:

> +PYTHON_CERTIFI_VERSION = 14.05.14
> +PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
> +PYTHON_CERTIFI_SITE = https://pypi.python.org/packages/source/c/certifi
> +PYTHON_CERTIFI_SETUP_TYPE = setuptools
> +PYTHON_CERTIFI_LICENSE = ISC, MPL

Can this be more specific, like to what part the ISC license applies,
and to what part the MPL license applies?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
