From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Dec 2019 22:37:02 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/qt5/qt5webengine: fix build
 error
In-Reply-To: <2e8aa826-ed63-813d-f5a6-4500b6b06486@benettiengineering.com>
References: <20191221111218.26960-1-b.bilas@grinn-global.com>
 <f1c338c9-88fd-80f0-87af-da0b2b9ef902@benettiengineering.com>
 <2e8aa826-ed63-813d-f5a6-4500b6b06486@benettiengineering.com>
Message-ID: <20191221223702.6a064f02@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Giulio,

On Sat, 21 Dec 2019 19:26:42 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> > This commit adds a patch from upstream chromium[1] that allows passing
> > -I instead of -isystem to CFLAGS.  
> 
> which caused bug [2],

[...]
> 
> [2]
> https://bugreports.qt.io/browse/QTBUG-53375

I disagree: this bug report is about an issue in qmake, while the patch
from Bartosz is fixing the Chromium code. So even if both are related
to -isystem issues, they are not the same problem as far as I can see.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
