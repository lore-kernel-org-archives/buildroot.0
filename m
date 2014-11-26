From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 26 Nov 2014 09:41:17 -0300
Subject: [Buildroot] [PATCH v3] package/network-manager: NM needs
 isc-dhcpc or dhcpcd
In-Reply-To: <1416999055-11095-1-git-send-email-nroach44@gmail.com>
References: <1416999055-11095-1-git-send-email-nroach44@gmail.com>
Message-ID: <5475CA6D.4040009@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/26/2014 07:50 AM, Nathaniel Roach wrote:

> NM only currently supports isc-dhcpc, dhcpcd and dhclient
> as clients because NM communicates with the client
> through DBus, and support for clients needs to be
> written in. (as per files in src/dhcp-manager)
> 
> Buildroot's default, udhcpc is not supported, and
> dhclient is not in buildroot.
> 
> Add the dependencies to Config.in, favoring dhcpcd as
> default due to size.

Just to clarify, dhclient IS the isc dhcp dhcp client.
There's no such thing as a separate dhclient package.
Regards.
