From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 14:59:36 +0200
Subject: [Buildroot] [PATCH buildroot-test 3/4] utils/daily-mail: add
 some debug information for the Notification class
In-Reply-To: <20190708081406.28215-4-victor.huesca@bootlin.com>
References: <20190708081406.28215-1-victor.huesca@bootlin.com>
 <20190708081406.28215-4-victor.huesca@bootlin.com>
Message-ID: <20190801145936.1dab179b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  8 Jul 2019 10:14:05 +0200
Victor Huesca <victor.huesca@bootlin.com> wrote:

> It was useful to me when working on adding support for new notification
> so it may help someone else.
> 
> Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>

This should be added before the outdated package feature, and then the
patch adding the outdated feature will just add the two lines about
self.package_version_notification.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
