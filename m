From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Feb 2016 23:01:00 +0100
Subject: [Buildroot] [PATCH] python-smbus-cffi: new package
In-Reply-To: <1451599710-7304-1-git-send-email-yegorslists@googlemail.com>
References: <1451599710-7304-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160203230100.57ec5e97@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Thu, 31 Dec 2015 23:08:30 +0100, Yegor Yefremov wrote:
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/Config.in                                |  1 +
>  package/python-smbus-cffi/Config.in              |  9 +++++++++
>  package/python-smbus-cffi/python-smbus-cffi.hash |  3 +++
>  package/python-smbus-cffi/python-smbus-cffi.mk   | 15 +++++++++++++++
>  4 files changed, 28 insertions(+)
>  create mode 100644 package/python-smbus-cffi/Config.in
>  create mode 100644 package/python-smbus-cffi/python-smbus-cffi.hash
>  create mode 100644 package/python-smbus-cffi/python-smbus-cffi.mk

Even though this patch was no longer in patchwork, I applied it as I
used it as a test case for the python-cffi stuff.

I had to fix the license though:

    [Thomas:
     - fix license, it's GPLv2, not GPLv2+.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
