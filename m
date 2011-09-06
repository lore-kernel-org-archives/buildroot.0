From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Sep 2011 18:03:05 +0200
Subject: [Buildroot] [PATCH 1/2] Add support for package-declared devices
In-Reply-To: <4E64F592.8080209@free-electrons.com>
References: <cover.1314965303.git.maxime.ripard@free-electrons.com>
 <20110905085210.705e63a0@skate> <4E64F592.8080209@free-electrons.com>
Message-ID: <201109061803.05970.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Monday 05 September 2011 18:15:14, Maxime Ripard wrote:
> Hi,
> 
> On 05/09/2011 08:52, Thomas Petazzoni wrote:
> > Hello,
> > 
> > Le Sun, 4 Sep 2011 23:36:43 +0200,
> > 
> > Arnout Vandecappelle <arnout@mind.be> a ?crit :
> >>  Good idea!  This will also make it possible to create setuid
> >> executables.
> > 
> > Yes, exactly. However, I don't really like the name <pkg>_DEVICE_TABLE
> > because, it might be for other purposes as well (setting setuid bit,
> > giving specific owner/group or permissions, etc.). Does anyone has an
> > idea for a better name?
> 
> I agree, I don't like it neither, but I have no idea on what could be
> better...
> 
> Files, maybe, but I find it way too generic.

 How about _FILE_MOD_TABLE (cfr. chmod)?

 BTW, BR2_ROOTFS_DEVICE_TABLE the device_table.txt files should change in the 
same way.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
