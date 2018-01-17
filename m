From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 09:43:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: needs readline
In-Reply-To: <20180114145324.2d13fdf6@windsurf>
References: <20180113224532.2715-1-bernd.kuhls@t-online.de>
 <20180114053204.qzh6l3xgqywgcmyr@sapphire.tkos.co.il>
 <20180114145324.2d13fdf6@windsurf>
Message-ID: <20180117094315.0f02ffaa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sun, 14 Jan 2018 14:53:24 +0100, Thomas Petazzoni wrote:

> I agree it would be nice to check with upstream. They seem to have
> intentionally added shell.c to the shared library, and this file
> clearly unconditionally uses readline.
> 
> Perhaps it's their README file that is now incorrect.
> 
> Bernd, could you check with the upstream developers what they say about
> this?

Have you had the chance to bring this up to the upstream developers?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
