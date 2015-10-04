From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2015 20:15:58 +0200
Subject: [Buildroot] [PATCH 3/7] u-boot: add an option to indicate that
	DTC is needed
In-Reply-To: <1443901457-7914-4-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 3 Oct 2015 20:44:13 +0100")
References: <1443901457-7914-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1443901457-7914-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87612mjy8x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Some U-Boot configurations require the Device Tree compiler to be
 > available, so we need to depend on host-dtc (example configuration:
 > zynq_zed).

 > However, we don't want to build it unconditionally, since the vast
 > majority of U-Boot configurations don't need it (and host-dtc itself
 > has a bunch of dependencies).

 > So, we simply add a Config.in option that allows users to indicate
 > whether their U-Boot needs DTC or not, and depend on host-dtc if this
 > option is enabled.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
