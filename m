From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Jan 2019 14:28:52 +0100
Subject: [Buildroot] [PATCH 2/2] lxc: bump to version 3.1.0
In-Reply-To: <20190112210844.4021-2-fontaine.fabrice@gmail.com>
References: <20190112210844.4021-1-fontaine.fabrice@gmail.com>
 <20190112210844.4021-2-fontaine.fabrice@gmail.com>
Message-ID: <20190113142852.41e5fdd6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Jan 2019 22:08:44 +0100, Fabrice Fontaine wrote:
> Remove both patchrs (already in version)

patchrs -> patches

Since you're removing both patches, we no longer have any patch
touching configure.ac. Is AUTORECONF = YES still needed ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
