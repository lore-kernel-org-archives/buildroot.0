From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 15:24:48 +0200
Subject: [Buildroot] [PATCH] package/sqlite: bump version 3.32.3
In-Reply-To: <20200709215759.53406-1-sam.voss@rockwellcollins.com>
References: <20200709215759.53406-1-sam.voss@rockwellcollins.com>
Message-ID: <20200711152448.26f4dff7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sam,

On Thu,  9 Jul 2020 16:57:59 -0500
Sam Voss <sam.voss@rockwellcollins.com> wrote:

> Fixes the following CVEs:

[...]

Thanks, I've applied. However, you should send patches based on master,
not based on 2020.02.x, unless of course they are only applicable to
2020.02.x.

In addition, for version bumps that we know have security fixes, we
like to have the commit title that says "security bump to version
X.Y.Z" or something along those lines.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
