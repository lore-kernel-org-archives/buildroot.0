From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Aug 2012 17:21:40 +0200
Subject: [Buildroot] [PATCH] schifra: new package
In-Reply-To: <1345801194-28735-1-git-send-email-spdawson@gmail.com>
References: <1345801194-28735-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120825172140.4b4cdda7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 24 Aug 2012 10:39:54 +0100,
spdawson at gmail.com a ?crit :

> +SCHIFRA_LICENSE = schifra license
> +SCHIFRA_LICENSE_FILES = schifra_license.txt

Shouldn't we put something like "GPLv2 or commercial" here? Apparently,
their license is: GPLv2 is you do something open-source, otherwise if
you want to link in a proprietary application, you need to buy a
commercial license. I would at least like to have explicitly "GPLv2"
mentioned here as it would more clearly raise the attention of people
checking the license compatibility of the libraries they are using.

Luca, thoughts?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
