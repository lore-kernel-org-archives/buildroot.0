From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 15:50:53 +0100
Subject: [Buildroot] [PATCH 1/1] botan: fix install directory
In-Reply-To: <1542983259-6868-1-git-send-email-sebastien.duponcheel@corp.ovh.com>
References: <1542983259-6868-1-git-send-email-sebastien.duponcheel@corp.ovh.com>
Message-ID: <20181123155053.2fd39fd5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution!

On Fri, 23 Nov 2018 15:27:39 +0100, DUPONCHEEL S?bastien wrote:
> Signed-off-by: DUPONCHEEL S?bastien <sebastien.duponcheel@corp.ovh.com>

It would be nice to have a bit more details in the commit log here, so
that we understand exactly what it is fixing, and whether this fix
should be pushed to the master branch or the next branch.

Is it that with the current DESTDIR value, botan gets installed in
STAGING_DIR/usr/usr ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
