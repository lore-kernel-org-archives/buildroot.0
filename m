From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 19 Jul 2013 10:15:53 -0300
Subject: [Buildroot] [PATCH] dhcp: add config option for delayed-ack
 feature of dhcp server
In-Reply-To: <2ac4c1f0c7025c5012b9.1374237997@BEANTN0L019720>
References: <2ac4c1f0c7025c5012b9.1374237997@BEANTN0L019720>
Message-ID: <51E93C09.2090906@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/19/2013 09:46 AM, Thomas De Schampheleire wrote:
> +config BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK
> +	bool "Enable delayed ACK feature"
> +	depends on BR2_PACKAGE_DHCP_SERVER
> +	help
> +	  Enable delayed ACK feature in the ISC DHCP server.

Can't you just enable it to avoid config cluttering?
AFAIK it's not a default-on option in dhcpd.conf
Regards.
