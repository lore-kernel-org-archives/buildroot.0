From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 15:30:11 +0200
Subject: [Buildroot] [PATCH] python-tomako: new package
In-Reply-To: <1467273304-2848-1-git-send-email-yegorslists@googlemail.com>
References: <1467273304-2848-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160701153011.49ef3fae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Jun 2016 09:55:04 +0200, yegorslists at googlemail.com wrote:

> +PYTHON_TOMAKO_VERSION = 0.1.0
> +PYTHON_TOMAKO_SOURCE = tomako-$(PYTHON_TOMAKO_VERSION).tar.gz
> +PYTHON_TOMAKO_SITE = https://pypi.python.org/packages/66/6f/de5449d401ca6953691c765d7465941e772cf99a3547646edc58cdca452d
> +PYTHON_TOMAKO_SETUP_TYPE = setuptools
> +PYTHON_TOMAKO_LICENSE = MIT

It would be good to ask upstream to add a license file.

Applied nonetheless, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
