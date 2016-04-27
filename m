From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 27 Apr 2016 11:36:37 +0200
Subject: [Buildroot] [PATCH v2] i7z: new package
References: <20160427081316.GB6060@jazz.nc.intel.com>
 <1461749107-2341-1-git-send-email-vincent.stehle@intel.com>
Message-ID: <5qd6vcx7kl.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 27 Apr 2016 11:25:07 +0200 schrieb Vincent Stehl?:

> +	depends on BR2_TOOLCHAIN_HAS_THREADS

Hi,

please add a comment like this to inform users why the package is not 
available:

comment "i7z needs a toolchain w/ threads"
	depends on !BR2_TOOLCHAIN_HAS_THREADS

Regards, Bernd
