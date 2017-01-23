From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Jan 2017 23:06:56 +0100
Subject: [Buildroot] [PATCH 1/2] board: add support for chiliBoard
In-Reply-To: <20170123153452.32063-1-m.niestroj@grinn-global.com> (Marcin
 Niestroj's message of "Mon, 23 Jan 2017 16:34:51 +0100")
References: <20170123153452.32063-1-m.niestroj@grinn-global.com>
Message-ID: <87wpdlig73.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcin" == Marcin Niestroj <m.niestroj@grinn-global.com> writes:

 > From: Marcin Niestroj <macius1990w@gmail.com>
 > Board support package includes:

 >  * Buildroot defconfig
 >  * Mainline Linux kernel v4.9.5
 >  * Mainline U-Boot v2017.01 with board support patches
 >  * genimage config to create sdcard image
 >  * Board readme.txt

 > Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

Thanks, looks good - But I see that your U-Boot patches (which you afaik
have posted today for the first time) has gotten some feedback, so I'll
wait a few days for those patches to settle.

-- 
Bye, Peter Korsgaard
