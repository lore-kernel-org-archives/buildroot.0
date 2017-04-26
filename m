From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Apr 2017 09:25:25 +0200
Subject: [Buildroot] [PATCH 1/9] package/python-decorator: New package
In-Reply-To: <20170425191423.13294-2-andrew.smirnov@gmail.com>
References: <20170425191423.13294-1-andrew.smirnov@gmail.com>
 <20170425191423.13294-2-andrew.smirnov@gmail.com>
Message-ID: <20170426092525.3a0b2661@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Apr 2017 12:14:15 -0700, Andrey Smirnov wrote:

> +PYTHON_DECORATOR_VERSION = 4.0.11
> +PYTHON_DECORATOR_SITE = https://github.com/micheles/decorator.git
> +PYTHON_DECORATOR_SITE_METHOD = git
> +PYTHON_DECORATOR_LICENSE = BSD-2c

This is not the correct SPDX license code: we have recently switched to
use SPDX license codes everywhere in Buildroot, so this should be
BSD-2-Clause (see https://spdx.org/licenses/).

This should be fixed globally in your patch series.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
