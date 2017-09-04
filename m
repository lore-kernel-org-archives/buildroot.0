From: Jaap Crezee <jaap@jcz.nl>
Date: Mon, 4 Sep 2017 21:28:23 +0200
Subject: [Buildroot] PATCH python-libusb1: new package
In-Reply-To: <CAGm1_ku+ASG+cBqfrdEphqTxQ_vOhDj8p=_dp0TGoFu2NeEjyg@mail.gmail.com>
References: <20170904151954.9550-1-jaap@jcz.nl>
 <CAGm1_ku+ASG+cBqfrdEphqTxQ_vOhDj8p=_dp0TGoFu2NeEjyg@mail.gmail.com>
Message-ID: <986c8b52-a53f-f7ab-7706-f41ad73b8e6c@jcz.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor, all,


On 09/04/17 19:21, Yegor Yefremov wrote:
> DEVELOPERS file entry missing.
> 
> Homepage link missing. https://github.com/vpelletier/python-libusb1
> 
> Comment about checksum origins missing. See
> package/python-tornado/python-tornado.hash for the reference.
> 
>> +md5     9c2eb6032deda59f287a443091d38cb4 libusb1-1.6.4.tar.gz
>> +sha256  8c930d9c1d037d9c83924c82608aa6a1adcaa01ca0e4a23ee0e8e18d7eee670d  libusb1-1.6.4.tar.gz
>> +PYTHON_LIBUSB1_SETUP_TYPE = distutils
> 
> Should be setuptools

Agree on all; hashes calculated locally after download.

Can anybody else make those corrections? I will not be able to do that within short notice.

I saw about the PyPI scanner in the BR documentation. Would that have generated some of
the missing points above? I assebled the patch manually.

Kind regards,


Jaap
