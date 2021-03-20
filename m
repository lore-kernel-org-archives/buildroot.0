From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Mar 2021 17:50:43 +0100
Subject: [Buildroot] [PATCH 1/1] boot/uboot: fix compilation with
 PER_PACKAGE_DIRECTORIES enable
In-Reply-To: <20210310161646.23709-1-nicolas.toromanoff@foss.st.com> (Nicolas
 Toromanoff's message of "Wed, 10 Mar 2021 17:16:46 +0100")
References: <20210310161646.23709-1-nicolas.toromanoff@foss.st.com>
Message-ID: <87tup5sra4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicolas" == Nicolas Toromanoff <nicolas.toromanoff@foss.st.com> writes:

 > If PER_PACKAGE_DIRECTORIES=Y and using host-make package
 > (because BR2_FORCE_HOST_BUILD=Y or local make is too old)
 > .stamp_dotconfig target needs per-package/uboot/host/bin/host-make that doesn't exist yet.
 > Add host-make into UBOOT_KCONFIG_DEPENDENCIES.

 > Signed-off-by: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
