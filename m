From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 24 Jan 2016 15:39:29 -0200
Subject: [Buildroot] [PATCH v4 1/1] package/dhcp: bump version to
	4.3.3-P1
References: <56a50b37b7661_7e95f439f49246c@ultri2.mail>
Message-ID: <56a50c5151608_7e953faa1a6e6b689269@ultri2.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 24, 2016 at 03:34 PM, Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:
> On Sat, Jan 23, 2016 at 01:39 PM, Doug Kehn <rdkehn@yahoo.com> wrote:
[snip]

Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Build test for arm using both external and buildroot toolchains, with
all package flags enabled (client, server, relay).
Basic run test (calling 'dhclient -v' gets an IPv4 address) using a
qemu-system-arm target.
