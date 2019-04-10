From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 13:37:39 +0200
Subject: [Buildroot] [PATCH] package/gettext-tiny: bump version for
 having msgmerge working
In-Reply-To: <20190409174606.31828-1-giulio.benetti@micronovasrl.com>
References: <20190409174606.31828-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190410133739.54867aa5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Apr 2019 19:46:06 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> On current version msgmerge doesn't work properly. It exits giving:
> fopen: No such file or directory
> The problem has been signalled and fixed by upstream.
> 
> Bump version to latest commit.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Is this fixing a build issue with some particular package ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
