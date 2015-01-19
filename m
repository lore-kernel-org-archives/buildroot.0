From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 19 Jan 2015 09:30:27 -0300
Subject: [Buildroot] [PATCH] package/nettle: bump version
In-Reply-To: <1421589567-19731-1-git-send-email-yann.morin.1998@free.fr>
References: <1421589567-19731-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <54BCF8E3.7090106@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/18/2015 10:59 AM, Yann E. MORIN wrote:

> -NETTLE_VERSION = 2.7.1
> +NETTLE_VERSION = 3.0

Hi.
Careful there, nettle 3 breaks API a bit and gnutls doesn't like it as is.
Regards.
