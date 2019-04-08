From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Apr 2019 22:17:11 +0200
Subject: [Buildroot] [PATCH v2] python-numpy: add sublibraries licenses
In-Reply-To: <b58c2ea4-0575-8360-10e1-2a6bbc753fa7@micronovasrl.com>
References: <20180911124632.72416-1-giulio.benetti@micronovasrl.com>
 <4419822d-fcff-54bf-5a2e-92876e301f7d@micronovasrl.com>
 <e2fb25a2-c910-70b7-48fd-6ed096a3d91e@micronovasrl.com>
 <b58c2ea4-0575-8360-10e1-2a6bbc753fa7@micronovasrl.com>
Message-ID: <20190408221711.71a96f63@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Giulio,

On Sun, 7 Apr 2019 22:58:39 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> Python-numpy has been bumped to 1.16.2 so this patch doesn't make sense 
> anymore.

Why do you say that the patch doesn't make sense anymore ? The
python-numpy license information still isn't complete:

PYTHON_NUMPY_LICENSE = BSD-3-Clause
PYTHON_NUMPY_LICENSE_FILES = LICENSE.txt

Yes, your patch needs to be updated/refreshed, but it certainly makes
sense to have such a patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
