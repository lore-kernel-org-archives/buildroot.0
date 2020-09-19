From: Gervais, Francois <FGervais@distech-controls.com>
Date: Sat, 19 Sep 2020 17:42:13 +0000
Subject: [Buildroot] [PATCH 1/1] package/kismet: bump version to
 2020-09-R2
In-Reply-To: <20200919142131.34999f64@windsurf.hq.k.grp>
References: <20200918175953.6888-1-fgervais@distech-controls.com>,
 <20200919142131.34999f64@windsurf.hq.k.grp>
Message-ID: <DM6PR01MB3755BB8C323A54CF26EECA9EF33C0@DM6PR01MB3755.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From what I can see, Fabrice seems to have the better patch.
I'll give it a try on monday, see if it works on my end and report here.

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Sent: September 19, 2020 8:21 AM
To: Gervais, Francois <FGervais@distech-controls.com>
Cc: buildroot at buildroot.org <buildroot@buildroot.org>; Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/kismet: bump version to 2020-09-R2 
?
Hello Fran?ois,

On Fri, 18 Sep 2020 13:59:53 -0400
Francois Gervais via buildroot <buildroot@busybox.net> wrote:

> Signed-off-by: Francois Gervais <fgervais@distech-controls.com>

Thanks for this patch! It turns out that today, Fabrice Fontaine has
also sent a patch also bumping the kismet package.

However, your changes are quite radically different. Could you
synchronize, compare your changes, and propose a common solution ?

Fabrice: in your patch, it would at least be nice to split the addition
of python tools support into a separate patch, i.e the first patch
should have an unconditional --disable-python-tools, with the second
patch adding the option to enable python tools.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://urldefense.com/v3/__https://bootlin.com__;!!Po4YltK3bPMkYw!j8Wm5n3iF1ibtKcxFpnIhX9UjwZJR2ivXQEarg2LQPSGTqBIcLGOFvW9fOgPqZWMbDNynRU$ 
