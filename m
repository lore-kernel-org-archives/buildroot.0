From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 22:11:59 +0200
Subject: [Buildroot] [PATCH v2 03/10] package/python-simplegeneric: New
 package
In-Reply-To: <20170427213340.26917-4-andrew.smirnov@gmail.com>
References: <20170427213340.26917-1-andrew.smirnov@gmail.com>
 <20170427213340.26917-4-andrew.smirnov@gmail.com>
Message-ID: <20170504221159.78c58dfa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Apr 2017 14:33:33 -0700, Andrey Smirnov wrote:

>  package/Config.in                                     |  1 +
>  package/python-simplegeneric/Config.in                |  6 ++++++
>  .../python-simplegeneric/python-simplegeneric.hash    |  3 +++
>  package/python-simplegeneric/python-simplegeneric.mk  | 19 +++++++++++++++++++

Entry was missing in DEVELOPERS file.


> +PYTHON_SIMPLEGENERIC_VERSION = 0.8.1
> +PYTHON_SIMPLEGENERIC_SOURCE = simplegeneric-$(PYTHON_SIMPLEGENERIC_VERSION).zip
> +PYTHON_SIMPLEGENERIC_SITE = https://pypi.python.org/packages/3d/57/4d9c9e3ae9a255cd4e1106bb57e24056d3d0709fc01b2e3e345898e49d5b
> +PYTHON_SIMPLEGENERIC_LICENSE = BSD-3-Clause

This is wrong, license was ZPL-2.1.

Committed with those two issues fixed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
