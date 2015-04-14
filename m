From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Apr 2015 15:54:16 -0300
Subject: [Buildroot] wide-dhcpv6 crash when built in buildroot version
 2014.05 using a cross toolchain arm-buildroot-linux-gnueabihf with gcc
 version 4.8.3
In-Reply-To: <620A1A0EF5A8FD49AAB6076B610B85DD45C34E42@LTX-EXCH03.int.lantronix.com>
References: <620A1A0EF5A8FD49AAB6076B610B85DD45C34E42@LTX-EXCH03.int.lantronix.com>
Message-ID: <552D6258.708@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/14/2015 03:25 PM, Srinivasan R wrote:

> Hi All,
> I am using the latest version of buildroot (2014.05) for my project, I happen to port the wide-dhcpv6 package which I had in the previous version(buildroot-2010.05) to the current buildroot version(2014.05).

Hi.
Well, the package hasn't been ported to any modern package format, so
debugging an old (very old) package just thrown into a new buildroot
version is generally a no-go since the old style hasn't been accepted or
used for a long time.
Otherwise there are many things that could go wrong.
Also you don't specify the precise target or a defconfig to check.
I suggest you convert the package to a generic one (look at the manual),
try again and see if it still fails.
Alternatively if you're in such a rush you could use dibbler which is a
far more modern/maintained DHCPv6 client/server/relay.
Regards.
