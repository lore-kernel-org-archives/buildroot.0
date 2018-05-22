From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 May 2018 12:11:01 +0200
Subject: [Buildroot] [PATCH v2 1/5] package/protobuf: bump to version
 3.5.1
In-Reply-To: <20180521175310.18563-2-charles.hardin@storagecraft.com>
References: <20180521175310.18563-1-charles.hardin@storagecraft.com>
 <20180521175310.18563-2-charles.hardin@storagecraft.com>
Message-ID: <20180522121101.07546890@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Charles,

On Mon, 21 May 2018 10:53:06 -0700, charles.hardin at storagecraft.com
wrote:
> From: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
> 
> GRPC requires protobuf 3.5.0+
> 
> Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> (cherry picked from commit 454aa2da5e79ec8627f1d66ac640ec7bb04025dc)

Why are you sending this patch? It's already in the next branch. Since
what you're sending is intended for the next branch, you should simply
base your patches on the next branch, and send only what's not yet in
next.

I'll mark this patch as Not Applicable in our patch tracking system.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
