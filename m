From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Sep 2011 08:52:10 +0200
Subject: [Buildroot] [PATCH 1/2] Add support for package-declared devices
In-Reply-To: <201109042336.44526.arnout@mind.be>
References: <cover.1314965303.git.maxime.ripard@free-electrons.com>
 <4aaac08b6012188f28e05ee700f9be550b40dde4.1314965303.git.maxime.ripard@free-electrons.com>
 <201109042336.44526.arnout@mind.be>
Message-ID: <20110905085210.705e63a0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Sun, 4 Sep 2011 23:36:43 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>  Good idea!  This will also make it possible to create setuid
> executables.

Yes, exactly. However, I don't really like the name <pkg>_DEVICE_TABLE
because, it might be for other purposes as well (setting setuid bit,
giving specific owner/group or permissions, etc.). Does anyone has an
idea for a better name?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
