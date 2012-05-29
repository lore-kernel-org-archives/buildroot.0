From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 May 2012 17:56:55 -0300
Subject: [Buildroot] [PATCH] quota: new package (v2)
In-Reply-To: <1338324748-27437-1-git-send-email-jarkko.sakkinen@intel.com>
References: <1338324748-27437-1-git-send-email-jarkko.sakkinen@intel.com>
Message-ID: <2003dbf485cd1a69315918348cd65514@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-05-29 17:52, Jarkko Sakkinen wrote:

> --- a/fs/skeleton/etc/network/interfaces
> +++ b/fs/skeleton/etc/network/interfaces
> @@ -2,3 +2,5 @@
>  auto lo
>  iface lo inet loopback
>
> +auto eth0
> +iface eth0 inet dhcp

Oops? It shouldn't be touching this file.

> +QUOTA_SOURCE = quota-$(QUOTA_VERSION).tar.gz

Not strictly necessary, it's the default, though it's a minor detail.
Regards.
