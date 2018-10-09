From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 22:03:28 +0200
Subject: [Buildroot] [PATCH 1/1] jasper: bump to version 2.0.14
In-Reply-To: <20181009191308.22634-1-fontaine.fabrice@gmail.com>
References: <20181009191308.22634-1-fontaine.fabrice@gmail.com>
Message-ID: <20181009220328.66696cd9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Oct 2018 21:13:08 +0200, Fabrice Fontaine wrote:
> - Update license to use SPDX short identifier
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Could you do this in two separate commits?

Fixing the SPDX tag (and possibly adding the license file hash) should
be one commit, that we can then backport to 2018.02.x.

Bumping should come as a separate patch, that will only be applied to
master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
