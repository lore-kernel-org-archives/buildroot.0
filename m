From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Mar 2017 22:46:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: bump version to
 5.44
In-Reply-To: <20170305094928.21040-1-bernd.kuhls@t-online.de>
References: <20170305094928.21040-1-bernd.kuhls@t-online.de>
Message-ID: <20170307224629.55ad890f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  5 Mar 2017 10:49:28 +0100, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/bluez5_utils/bluez5_utils.hash | 2 +-
>  package/bluez5_utils/bluez5_utils.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

This update causes a build failure:

  http://autobuild.buildroot.net/results/a0c/a0caac737848e7c4c97a8325fc29b11e69c1d70c/build-end.log

/usr/bin/install -D -m 0755 /home/buildroot/autobuild/run/instance-3/output/build/bluez5_utils-5.44/attrib/gatttool /home/buildroot/autobuild/run/instance-3/output/target/usr/bin/gatttool
/usr/bin/install: cannot stat '/home/buildroot/autobuild/run/instance-3/output/build/bluez5_utils-5.44/attrib/gatttool': No such file or directory

Could you have a look ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
