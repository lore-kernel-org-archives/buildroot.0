From: Atharva Lele <itsatharva@gmail.com>
Date: Tue, 06 Aug 2019 23:40:08 +0530
Subject: [Buildroot] [PATCH 2/2] utils/genrandconfig: only do
 reproducible builds with diffoscope
In-Reply-To: <20190804091319.32679-2-thomas.petazzoni@bootlin.com>
References: <20190804091319.32679-1-thomas.petazzoni@bootlin.com>
 <20190804091319.32679-2-thomas.petazzoni@bootlin.com>
Message-ID: <4052973.vgdHRaHyxq@msi-manjaro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday, August 4, 2019 2:43:19 PM IST Thomas Petazzoni wrote:
> After a few weeks of running reproducible builds in the autobuilders,
> we found out that such builds without a diffoscope analysis are pretty
> useless: the cmp on the tarballs doesn't help us fix the
> reproducibility issue.
> 
> So, let's only do reproducible builds when diffoscope is available.

That makes sense.

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Tested with and without diffoscope installed. Does not enable BR2_REPRODUCIBLE 
if diffoscope is not installed.

Tested-by: Atharva Lele <itsatharva@gmail.com>
Acked-by: Atharva Lele <itsatharva@gmail.com>

Regards,
Atharva Lele
