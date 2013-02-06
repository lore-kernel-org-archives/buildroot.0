From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 06 Feb 2013 10:10:06 -0300
Subject: [Buildroot] strongswan
In-Reply-To: <72CF78B565764947818F20980E8F15DB062199701B57@s-mail.fmn.local>
References: <72CF78B565764947818F20980E8F15DB062199701B57@s-mail.fmn.local>
Message-ID: <5112562E.5080902@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/06/2013 10:00 AM, Slomczyk, Sebastian wrote:

> Is a version of buildroot available where strongswan is supported? I
> tried to include strongswan to the package directory by myself but I get
> compilation errors.(e.g IPV6_PKTINFO is not declared ?)

Only openswan at the moment.
Patches for useful choices are always welcome.
That usually means your toolchain lacks IPv6 support, you should make
the package depend on it (depends on BR2_INET_IPV6) and then try again
with a toolchain that has support for it.
Regards.
