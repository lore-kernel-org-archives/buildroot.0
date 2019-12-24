From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 14:56:04 +0100
Subject: [Buildroot] [PATCH 1/1 next] package/linux-firmware: Add
 options for ar301[12] bluetooth firmware.
In-Reply-To: <20191129163144.26318-1-nicolas.cavallari@green-communications.fr>
References: <20191129163144.26318-1-nicolas.cavallari@green-communications.fr>
Message-ID: <20191224145604.124351f1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 29 Nov 2019 17:31:44 +0100
Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:

> This add two options for firmwares used by the ath3k firmware loader
> driver.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

Thanks, I've applied, but after doing two changes:

 (1) Split into two commits, one for the AR3011 firmware and one for
 the AR3012 firmware. These are independent things, so they should be
 added by two independent commits

 (2) Add the hash of the additional license file you're using for
 AR3012, LICENSE.QualcommAtheros_ar3k

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
