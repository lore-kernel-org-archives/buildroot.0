From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Nov 2020 21:21:57 +0100
Subject: [Buildroot] [PATCH 1/2] wlroots: package does not require
 locale support
In-Reply-To: <20201122160008.44129-1-paul@crapouillou.net>
References: <20201122160008.44129-1-paul@crapouillou.net>
Message-ID: <20201122212157.69b462f8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 22 Nov 2020 16:00:07 +0000
Paul Cercueil <paul@crapouillou.net> wrote:

> Drop dependency on BR2_ENABLE_LOCALE, which was marked as a dependency
> of libinput which is selected by wlroots. However, libinput does not
> depend at all on BR2_ENABLE_LOCALE.

The dependency of libinput on BR2_ENABLE_LOCALE was dropped in commit
bef6b92b67e08ee8cba085ae95af7e94e7a28202.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
