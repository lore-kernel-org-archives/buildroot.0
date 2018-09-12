From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 09:38:44 +0200
Subject: [Buildroot] [PATCH v3] gst1-plugins-good: add option for qmlgl
 plugin (qt5 plugin)
In-Reply-To: <bc71b70d-11c7-dd70-2083-6deb7052a3ba@fanamoel.com>
References: <20180815210249.5e11df4d@gmx.net>
 <1535958840-4452-1-git-send-email-inigohuguet@fanamoel.com>
 <20180908220752.4254ec4c@windsurf.home>
 <bc71b70d-11c7-dd70-2083-6deb7052a3ba@fanamoel.com>
Message-ID: <20180912093844.306ff551@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Sep 2018 08:46:14 +0200, I?igo Huguet wrote:

> I've tried to build gst1-plugins-good after applying your patch and 
> removing the file 0001-configure-fix-qt-qpa-detection.patch. It builds 
> with QT plugin enabled, so your solution works.

Thanks a lot for testing this.

> I'm going to prepare a new iteration of my patch, remember to commit 
> yours one first or it won't work.

When sending the patch, please indicate below the "---" sign that is
under your Signed-off-by line that there is a dependency on the pkgconf
bump.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
