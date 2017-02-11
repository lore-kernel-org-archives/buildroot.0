From: Andreas Naumann <dev@andin.de>
Date: Sat, 11 Feb 2017 11:58:56 +0100
Subject: [Buildroot] [PATCH 2/2] poppler: qt5 support needs c++11 (since
 Qt5.7)
In-Reply-To: <20170210163908.5ae678a0@free-electrons.com>
References: <1486735198-29936-1-git-send-email-anaumann@ultratronik.de>
 <1486735198-29936-3-git-send-email-anaumann@ultratronik.de>
 <20170210163908.5ae678a0@free-electrons.com>
Message-ID: <fee4a854-c3af-f263-2ea8-707b90a85033@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am 10.02.2017 um 16:39 schrieb Thomas Petazzoni:
> Hello,
>
> On Fri, 10 Feb 2017 14:59:58 +0100, Andreas Naumann wrote:
>
>> +# since Qt5.7.x c++11 is needed (LTS Qt5.6.x is the last one without this requirement)
>> +ifneq ($(BR2_QT5_VERSION_5_6),y)
>
> Reviewing lead me to realize that we did a mistake when naming those
> options. They should be named BR2_PACKAGE_QT5_VERSION_XYZ, and not
> BR2_QT5_VERSION_XYZ.

Ok, I'll resend this including the option rename as first patch.

regards,
Andreas

>
> We want to fix this before 2017.02 is released.
>
> Thomas
>
