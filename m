From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 16:04:06 +0200
Subject: [Buildroot] [PATCH 1/1] python-daemon: new package
In-Reply-To: <1406216603-965-1-git-send-email-david.bachelart@bbright.com>
References: <1406216603-965-1-git-send-email-david.bachelart@bbright.com>
Message-ID: <20140727160406.24d9b861@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear David Bachelart,

On Thu, 24 Jul 2014 17:43:23 +0200, David Bachelart wrote:

> +PYTHON_DAEMON_VERSION = 1.5.5
> +PYTHON_DAEMON_SITE    = https://pypi.python.org/packages/source/p/python-daemon/

We typically don't align = signs anymore.

> +PYTHON_DAEMON_LICENSE = PSF-2+

The SPDX code for this license is Python-2.0, and I don't think the '+'
sign was correct. I've also added GPLv2+, which is used for the tests.

> +PYTHON_DAEMON_LICENSE_FILES = COPYING

This was incorrect, there was no COPYING file in the tarball. The
correct files where LICENSE.PSF-2 and LICENSE.GPL-2.

Applied with those changes, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
