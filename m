From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Feb 2018 15:34:52 +0100
Subject: [Buildroot] [PATCH 1/1] qt5enginio: bump to 1.6.3
In-Reply-To: <20180210131952.19924-1-gael.portay@savoirfairelinux.com>
References: <20180210131952.19924-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180210153452.256abab2@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Feb 2018 08:19:52 -0500, Ga?l PORTAY wrote:
> Qt Enginio has been bumped to 1.6.3 with Qt 5.6.3.
> 
> This new version follows the Qt release number and has only one change
> since 1.6.2[1].
> 
> [1]: https://github.com/qt/qtenginio/commit/e447818458c9211e95ee5e75e294f76b6abf32d4
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>

Since 5.6.3 is used in master, I've applied this patch to master, for
the sake of consistency. Also, the fact that there is a single change
gives quite some confidence that things should be fine.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
