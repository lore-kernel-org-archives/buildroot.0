From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Aug 2019 14:37:53 +0200
Subject: [Buildroot] [PATCH 2/2] package/wpa_supplicant: security bump
 version to 2.9
In-Reply-To: <20190825192843.21655-2-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 25 Aug 2019 21:28:43 +0200")
References: <20190825192843.21655-1-bernd.kuhls@t-online.de>
 <20190825192843.21655-2-bernd.kuhls@t-online.de>
Message-ID: <874l21qxcu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes https://w1.fi/security/2019-6/
 > Removed patch applied upstream:
 > http://w1.fi/cgit/hostap/commit/?id=f2973fa39d6109f0f34969e91551a98dc340d537

 > Removed all other upstream patches which are included in this release.

 > Release notes:
 > http://lists.infradead.org/pipermail/hostap/2019-April/039979.html
 > http://lists.infradead.org/pipermail/hostap/2019-August/040373.html

 > Support for the old dbus interface was removed upstream:
 > http://w1.fi/cgit/hostap/commit/?id=6a8dee76d4090287c016680c009b1334e01b5fbd

 > Removed Config.in option, removed _NEW from remaining dbus option,
 > select BR2_PACKAGE_DBUS when needed and added Config.in.legacy options.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
