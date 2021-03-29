From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Mar 2021 21:44:01 +0200
Subject: [Buildroot] [git commit] package/kodi: honour the libusb option
 even when disabled
In-Reply-To: <20210328075524.47250888A7@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sun, 28 Mar 2021 10:18:32 +0200")
References: <20210328075524.47250888A7@busybox.osuosl.org>
Message-ID: <878s65g2ym.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit:
 > https://git.buildroot.net/buildroot/commit/?id=0e1acc6e36b087c1008981e7bccf4113bfa1751d
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Make sure libusb support is properly disabled even if the libusb
 > package is enabled, and in case it gets built before Kodi.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
