From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 15:26:45 +0200
Subject: [Buildroot] [PATCH] linux: enable UEVENT_HELPER when mdev is
 used
In-Reply-To: <38daf6b1-3749-66f4-93b9-7f1222c7da16@mind.be>
References: <20190525130755.25678-1-peter@korsgaard.com>
 <54a85c9f-1e14-de0d-c6cf-8201dea50e1d@mind.be>
 <f887e49a-0327-9bcb-f524-2a9aa2527edb@railnova.eu>
 <38daf6b1-3749-66f4-93b9-7f1222c7da16@mind.be>
Message-ID: <20190601152645.2ad18a4e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 May 2019 15:57:22 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>  If you anyway have it, submit it, and we can discuss based on that.

Titouan has submitted his patch:

  http://patchwork.ozlabs.org/patch/1107175/

The commit title is probably not the best, but other than that, the
idea looks good to me.

>  It would be nice if you could also do a preparatory patch that converts the
> file to the "canonical init script format" (cfr. e.g.
> package/rsyslog/S01rsyslogd). mdev doesn't have arguments or a default, so that
> simplifies things a little.

Since the change to S10mdev from Titouan is kind of a fix, I would
actually not make the conversion to the "canonical format" a
requirement that should be done as a preparatory patch, but that's
admittedly a minor detail.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
