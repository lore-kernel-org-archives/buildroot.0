From: Charles Hardin <charles.hardin@storagecraft.com>
Date: Tue, 22 May 2018 17:18:15 +0000
Subject: [Buildroot] [PATCH v2 1/5] package/protobuf: bump to version
 3.5.1
In-Reply-To: <20180522121101.07546890@windsurf>
References: <20180521175310.18563-1-charles.hardin@storagecraft.com>
 <20180521175310.18563-2-charles.hardin@storagecraft.com>
 <20180522121101.07546890@windsurf>
Message-ID: <AD5C86F9-A62E-4AC7-94C1-D7AC33C6D672@storagecraft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On May 22, 2018, at 3:11 AM, Thomas Petazzoni <thomas.petazzoni at bootlin.com<mailto:thomas.petazzoni@bootlin.com>> wrote:

Hello Charles,

On Mon, 21 May 2018 10:53:06 -0700, charles.hardin at storagecraft.com<mailto:charles.hardin@storagecraft.com>
wrote:
From: Martijn de Gouw <martijn.de.gouw at prodrive-technologies.com<mailto:martijn.de.gouw@prodrive-technologies.com>>

GRPC requires protobuf 3.5.0+

Signed-off-by: Martijn de Gouw <martijn.de.gouw at prodrive-technologies.com<mailto:martijn.de.gouw@prodrive-technologies.com>>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni at bootlin.com<mailto:thomas.petazzoni@bootlin.com>>
(cherry picked from commit 454aa2da5e79ec8627f1d66ac640ec7bb04025dc)

Why are you sending this patch? It's already in the next branch. Since
what you're sending is intended for the next branch, you should simply
base your patches on the next branch, and send only what's not yet in
next.



The docs say to rebase against origin/master before submitting a patch not
origin/next. So, it is unclear if we are suppose to submit a patch series that
compiles as a set or a patch series that relies on something already in next.

I erred on a duplicated patch at the beginning to try and make sure it was
understood this patch series requires the bump - else, it won?t compile.

If there is a better a way to do this, then it wasn?t clear from contributing guide.

https://buildroot.org/downloads/manual/manual.html#submitting-patches


I'll mark this patch as Not Applicable in our patch tracking system.

Best regards,

Thomas
--
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com


Charles

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180522/af1ee5fb/attachment.html>
