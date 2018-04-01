From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 10:11:49 +0200
Subject: [Buildroot] [PATCH 1/4] package/kodi: remove libamcodec support
In-Reply-To: <4sf6pexo6d.ln2@ID-313208.user.individual.net>
References: <20180401070337.18301-1-bernd.kuhls@t-online.de>
 <trinity-60c51855-aef6-4353-90a8-2e1f048863e2-1522567079284@3c-app-mailcom-bs16>
 <trinity-8edc1929-b40d-4afa-85a8-e152cef642fb-1522567556973@3c-app-mailcom-bs16>
 <1je6pexo6d.ln2@ID-313208.user.individual.net>
 <trinity-550783d4-570b-41d5-937b-f66aa367d27f-1522568580265@3c-app-mailcom-bs16>
 <4sf6pexo6d.ln2@ID-313208.user.individual.net>
Message-ID: <20180401101149.773b5a83@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 01 Apr 2018 09:55:16 +0200, Bernd Kuhls wrote:
> Am Sun, 01 Apr 2018 09:43:00 +0200 schrieb daggs:
> 
> > odroidc2 boards use amlogic libs, infact I'm the maintainer of the
> > libamlogic pkg and I've added the support to kodi.  
> 
> Hi daggs,
> 
> should the buildroot package libamcodec depend on odroid-mali?

libamcodec is for the video decoding, odroid-mali is for the GPU. I
don't think there's a reason for libamcodec to depend on odroid-mali.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
