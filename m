From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 2 Sep 2018 22:12:36 +0200
Subject: [Buildroot] [[PATCH v2 0/2] mender-artifact support
In-Reply-To: <CADHdJwDwnZQTiEqfNDzBrjCxH8nr54TBBbCbJAxcm6OA+iodGg@mail.gmail.com>
References: <20180827113728.20856-1-mirza.krak@northern.tech>
 <20180902152532.6ae013a8@windsurf>
 <CADHdJwDwnZQTiEqfNDzBrjCxH8nr54TBBbCbJAxcm6OA+iodGg@mail.gmail.com>
Message-ID: <20180902221236.1306b4f8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 2 Sep 2018 22:00:17 +0200, Mirza Krak wrote:

> > Could you have a look into this ?  
> 
> This looks like this patch [1] is missing. Or at least it was a
> similar error that I got before that was fixed.
> 
> [1]. https://git.buildroot.net/buildroot/commit/?id=4eccbe3ef975fa7dcc8984fa9a19c778752d70af

Aaah, yes, my bad, sorry for not thinking about this. I tested your
host-golang-package + mender-artifact patches on top of the next
branch, while commit 4eccbe3ef975fa7dcc8984fa9a19c778752d70af was made
to the master branch, because it was a fix.

I will retry with this fixed merged into the next branch as well.

Sorry about that :-/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
