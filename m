From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Aug 2019 22:42:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/stellarium: new package
In-Reply-To: <ourk1gx4lk.ln2@ID-313208.user.individual.net>
References: <20190804160432.19791-1-bernd.kuhls@t-online.de>
 <20190805000752.06b970bf@windsurf.home>
 <ourk1gx4lk.ln2@ID-313208.user.individual.net>
Message-ID: <20190805224221.763abc48@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

Thanks for your feedback!

On Mon, 05 Aug 2019 07:38:00 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> both BR2_PACKAGE_QT5SCRIPT and BR2_PACKAGE_QT5SERIALPORT are only 
> optional dependencies. My goal is to enable all available options in 
> Config.in.

Then, we should handle them like we normally do for optional
dependencies, with only the logic in the .mk file, and not selects in
the Config.in file.

> Regarding OpenGL ES I need to test this option, for now I only did build-
> tests using OpenGL so the package depends on BR2_PACKAGE_HAS_LIBGL for 

Could you add a comment in Config.in about this ?

If you fix those two minor nits, and resend an updated version, I think
we should be good to go.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
