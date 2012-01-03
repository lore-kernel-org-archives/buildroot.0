From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Jan 2012 21:14:12 +0100
Subject: [Buildroot] [pull request v3] Pull request for branch
 for-2012.02/pkg-device
In-Reply-To: <cover.1325583983.git.maxime.ripard@free-electrons.com>
References: <y>
	<cover.1325583983.git.maxime.ripard@free-electrons.com>
Message-ID: <20120103211412.491fad60@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue,  3 Jan 2012 11:13:55 +0100,
y at mail.free-electrons.com a ?crit :

> are available in the git repository at:
>   http://free-electrons.com/~maxime/git/buildroot.git for-2012.02/pkg-device
> 
> Maxime Ripard (3):
>       Add support for package-declared devices
>       Convert busybox to the device declaration method
>       Migrate Xenomai to the new infrastructure
> 
>  fs/common.mk                        |    4 ++++
>  package/Makefile.package.in         |    2 ++
>  package/busybox/busybox.mk          |    5 +++++
>  package/xenomai/xenomai.mk          |    8 ++++++--
>  target/generic/device_table.txt     |    2 --
>  target/generic/device_table_dev.txt |    5 -----
>  6 files changed, 17 insertions(+), 9 deletions(-)

I haven't actually tested those patches, but I'm ok with the principle
and its implementation.

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
