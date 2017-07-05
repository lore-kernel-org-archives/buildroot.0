From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 11:30:43 +0200
Subject: [Buildroot] [PATCH v6 10/10] package/qt5base: provide "qt.conf"
 to make "qmake" relocatable
In-Reply-To: <ccd502d6-648b-7a9d-1d64-6e14eb90196f@mind.be>
References: <1499185359-8293-1-git-send-email-wg@grandegger.com>
 <1499185359-8293-11-git-send-email-wg@grandegger.com>
 <ccd502d6-648b-7a9d-1d64-6e14eb90196f@mind.be>
Message-ID: <20170705113043.5007de39@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 5 Jul 2017 10:59:40 +0200, Arnout Vandecappelle wrote:

> On 04-07-17 18:22, Wolfgang Grandegger wrote:
> > The file "qt.conf" can be used to override the hard-coded paths that are
> > compiled into the Qt library. We need it to make "qmake" relocatable.  
> 
>  All qt5 packages are failing because of this, e.g.
> http://autobuild.buildroot.net/results/33e/33eb7b7ef7d232bed2432d1d44fd80a4fc8c4e2d
> 
> qt5serialport: installs files in
> /accts/mlweber1/instance-2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot//accts/mlweber1/instance-2/output

Due to the numerous build failures caused by this patch, I reverted the
commit.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
