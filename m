From: Michael Trimarchi <michael@amarulasolutions.com>
Date: Mon, 9 Mar 2015 14:53:17 +0100
Subject: [Buildroot] [PATCH V2] python: spidev: add spidev plugin to
 manage spi from userspace
In-Reply-To: <20150309143321.4355fa64@free-electrons.com>
References: <1425803293-25109-1-git-send-email-michael@amarulasolutions.com>
 <20150309143321.4355fa64@free-electrons.com>
Message-ID: <CAOf5uwmuH67Si+yEO9wz_E=PxUxN=TioxLcr58pfD2vf4U3xgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

On Mon, Mar 9, 2015 at 2:33 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Michael Trimarchi,
>
> On Sun,  8 Mar 2015 09:28:13 +0100, Michael Trimarchi wrote:
>
>> +PYTHON_SPIDEV_VERSION = 3.0
>> +PYTHON_SPIDEV_SOURCE = spidev-$(PYTHON_SPIDEV_VERSION).tar.gz
>> +PYTHON_SPIDEV_SITE = https://pypi.python.org/packages/source/s/spidev
>> +PYTHON_SPIDEV_SETUP_TYPE = distutils
>> +PYTHON_SPIDEV_LICENSE = GPLv2
>> +PYTHON_SPIDEV_LICENSE_FILES = LICENSE
>
> There is no file named "LICENSE" in the source code of python-spidev.
> The file is named LICENSE.md.
>
> Also, the commit title for new package should normally be:
>
>         <pkgname>: new package
>
> so in this case:
>
>         python-spidev: new package
>
> I've fixed those issues (especially the license file one), and applied
> your patch.
>

Sorry, I will do better next time

Michael


> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
