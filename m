From: John Gulbrandsen <John.Gulbrandsen@wdc.com>
Date: Sat, 3 Dec 2016 00:30:07 +0000
Subject: [Buildroot]
 =?windows-1252?q?SH4A_target=3A_error=3A_command_line?=
 =?windows-1252?q?_option_=91-m4-nofpu=92_is_not_supported_by_this_configu?=
 =?windows-1252?q?ration?=
In-Reply-To: <20161202213122.57dffb8d@free-electrons.com>
References: <DM5PR04MB0635AD43067B754A23B8BAEE958F0@DM5PR04MB0635.namprd04.prod.outlook.com>
 <20161202095821.0b9fc50c@free-electrons.com>
 <DM5PR04MB0635485E4E8675471039DD12958E0@DM5PR04MB0635.namprd04.prod.outlook.com>
 <20161202213122.57dffb8d@free-electrons.com>
Message-ID: <DM5PR04MB0635D71BBC53598FA771815995810@DM5PR04MB0635.namprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> gcc-final.mk
> HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4,m4-nofpu,m4a,m4a-nofpu"

This change works and I now get a complete build. I will next try to verify good build with QEMU.

Thanks for the help.
/John.

John Gulbrandsen
Western Digital Corporation (and its subsidiaries) E-mail Confidentiality Notice & Disclaimer:

This e-mail and any files transmitted with it may contain confidential or legally privileged information of WDC and/or its affiliates, and are intended solely for the use of the individual or entity to which they are addressed. If you are not the intended recipient, any disclosure, copying, distribution or any action taken or omitted to be taken in reliance on it, is prohibited. If you have received this e-mail in error, please notify the sender immediately and delete the e-mail in its entirety from your system.
