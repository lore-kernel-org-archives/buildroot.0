From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Jul 2017 11:25:17 +0200
Subject: [Buildroot] [PATCH 0/8] Fix the python cffi issue
In-Reply-To: <20170712162801.31131-1-thomas.petazzoni@free-electrons.com>
References: <20170712162801.31131-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170713112517.41c87bfd@windsurf.orange-hotspot.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Jul 2017 18:27:53 +0200, Thomas Petazzoni wrote:

> Thomas Petazzoni (8):
>   python-pyasn: switch to setuptools instead of distutils
>   python-pyro: switch to setuptools instead of distutils
>   python-u-msgpack: switch to setuptools instead of distutils
>   python-versiontools: add host variant
>   python-json-schema-validator: needs versiontools on the host
>   python-incremental: add host variant
>   python-treq: needs host-python-incremental
>   python: remove target Python packages from PYTHONPATH

Following Yegor's review, and tests (reported on IRC), I've applied
this series. I wanted to apply it quickly to get rid of the noisy
autobuilder failures on python-cryptography, and see if it doesn't
introduce problems in other Python packages.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
