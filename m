From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 04 Aug 2015 07:09:08 +0200
Subject: [Buildroot] [PATCH] mtd: bump to version 1.5.2
In-Reply-To: <1438634492-31171-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438634492-31171-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438664948.2172.3.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mo, 2015-08-03 at 17:41 -0300, Gustavo Zacarias wrote:
> Patches upstream so drop them.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Version 1.5.2 also adds the 'mtdpart' utility. Maybe we should add this
as BR2_PACKAGE_MTD_MTDPART in a follow up patch?

Best regards
J?rg Krause
