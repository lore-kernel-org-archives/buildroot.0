From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 21:45:46 +0100
Subject: [Buildroot] [PATCH 1/1] qt5cinex: depends also on
 qt5quickcontrols
In-Reply-To: <32a0057b-1840-ef45-c199-9da6b14ae09c@micronovasrl.com>
References: <1510677027-24076-1-git-send-email-giulio.benetti@micronovasrl.com>
 <e8c172b8-f2ec-ced1-dda8-236d0d945b12@micronovasrl.com>
 <20171114165808.akqens5j5obw2n5c@tarshish>
 <32a0057b-1840-ef45-c199-9da6b14ae09c@micronovasrl.com>
Message-ID: <20171123214546.7e982b20@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Nov 2017 18:03:53 +0100, Giulio Benetti wrote:
> Sorry, my mistake.
> It installed correctly on STAGING_DIR, but not in TARGET_DIR.
> This why it compiled fine, but on target it didn't find that 
> libQtQuick.so library.
> This is a problem on building Qt5 I've noticed.
> 
> If I build first time Qt5 with few features,
> than select other more features,
> those can be built partially and installed partially too.
> 
> To reproduce you can build qt5base.
> After that, select qt5cinex,
> then you should find that libraries are in STAGING_DIR but not in 
> TARGET_DIR.
> 
> So to have it working properly you have to rm and rebuild qt5base and 
> qt5declarative from beginning.
> 
> Did someone else noticed this?

So in the end, is your patch needed ?

Peter (Seiderer), could you review this Qt5 related patch ? Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
