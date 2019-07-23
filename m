From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jul 2019 00:25:14 +0200
Subject: [Buildroot] [PATCH V2] dejavu: Add missing license name and
 license hash
In-Reply-To: <20190723152816.20465-1-mickael.tansorier@smile.fr>
References: <20190723152816.20465-1-mickael.tansorier@smile.fr>
Message-ID: <20190724002514.2e252e64@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Adding Yann and Arnout (licensing question below)

On Tue, 23 Jul 2019 17:28:16 +0200
Micka?l Tansorier <mickael.tansorier@smile.fr> wrote:

> There is 3 licenses, not listed in SPDX license list:
> - Bitstream Vera Fonts
> - Arev Fonts
> - Public Domain

I'm not sure what you mean in this commit log. The actual code change
is to add "Bitstream Vera" to the list of licenses, which is also not
part of the SPDX license list.

Regarding SPDX and "Public Domain", see
https://wiki.spdx.org/view/Legal_Team/Decisions/Dealing_with_Public_Domain_within_SPDX_Files.

Also, I think you are misreading the LICENSE file. What it says is
"Bitstream Vera Fonts Copyright" and "Arev Fonts Copyright", which are
not license texts. The license text is below each of those titles.

Here is what Debian says about this font:
https://metadata.ftp-master.debian.org/changelogs//main/f/fonts-dejavu/fonts-dejavu_2.37-1_copyright

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
