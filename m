From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 06 Dec 2011 07:43:14 -0300
Subject: [Buildroot] [PATCH] netsnmp: bump to 5.7.1 LTS
In-Reply-To: <1323164603-5503-1-git-send-email-luca@lucaceresoli.net>
References: <1323164603-5503-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <ef682c5dfbfcc25c3eaec14233e080a5@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06.12.2011 06:43, Luca Ceresoli wrote:

> -NETSNMP_VERSION = 5.6.1.1
> +NETSNMP_VERSION = 5.7.1
>  NETSNMP_SITE =
> 
> http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/net-snmp
>  NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
>  NETSNMP_INSTALL_STAGING = YES

NAK.
The 5.7 series (up to 5.7.1) fails miserably with a segfault on 
powerpc.
Regards.
