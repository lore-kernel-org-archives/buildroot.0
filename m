From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Wed, 14 Mar 2018 16:20:38 +0100
Subject: [Buildroot] 
 =?iso-8859-1?q?=5BPATCH_1/2=5D_package/linux=3A_fix_?=
 =?iso-8859-1?q?custom_dts_files_handling?=
In-Reply-To: <20180313180006.5364-1-rafal.susz@gmail.com>
References: <20180313142635.27423-1-rafal.susz@gmail.com>
 <20180313180006.5364-1-rafal.susz@gmail.com>
Message-ID: <094ab561-5131-4824-bd24-e79be76b8851@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On ?ter? 13. b?ezna 2018 19:00:05 CET, Rafal Susz wrote:
> Custom dts files are still conditionally copied based on non existing
> boolean. So it is currently not possible to use custom dts file(s) at all.
>
> List of dts files is now iterated and files are copied into 
> dedicated kernel arch dir.
>
> Signed-off-by: Rafal Susz <rafal.susz@gmail.com>

Tested-by: Jan Kundr?t <jan.kundrat@cesnet.cz>

Tested on a config which uses two out-of-tree DTS files. Without this 
patch, the current master fails.

With kind regards,
Jan
