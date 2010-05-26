From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 May 2010 09:40:22 +0200
Subject: [Buildroot] Build fails aound host-mtd-1.3.1
In-Reply-To: <000001cafca3$627b5880$27720980$@com>
References: <000001cafca3$627b5880$27720980$@com>
Message-ID: <20100526094022.16a83e6e@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 26 May 2010 08:16:39 +0100
"Barry Bridges" <barry@disignconsultants.com> wrote:

> I have a build error towards the end of the build process, not 100%
> sure where the failure lies but the error and few preceding lines are
> below with my .config.  If I type make again it finishes the build,
> but I'm not sure if the build is correct or complete.

We have recently (post 2010.05-rc2) fixed a problem in MTD build due to
incorrect support of parallel build by the MTD build system.

Could you try with the git version, or wait a few days for the
2010.05-rc3 release to be out ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
