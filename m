From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Wed, 31 Oct 2012 11:26:41 +0100
Subject: [Buildroot] [PATCH] grantlee: new package
In-Reply-To: <5090E699.5070903@mind.be>
References: <508EFA6D.7000404@gmail.com> <50906999.9000002@mind.be>
 <5090E5F4.6040903@gmail.com> <5090E699.5070903@mind.be>
Message-ID: <5090FCE1.2020100@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/31/2012 09:51 AM, Arnout Vandecappelle wrote:
> On 10/31/12 09:48, Zoltan  Gyarmati wrote:
 >> Hi,
 >>
 >> Thx for the detailed comments, i'll resend it. And as i realized in
 >> the debian/ubuntu repos the package called libgrantlee, so maybe it
 >> would be better to call it so also in buildroot, as it's more
 >> logical name for a library :) What do you think?
 >
 > In buildroot, we prefer to use the upstream name.
 >
 > In Debian/Fedora distros, they split packages into a lib- and a bin-
 > package (and additional -dev and -dbg packages). For grantlee,
 > there is no bin-, so you don't get a plain grantlee package.
 >
 > In buildroot, we don't split the packages (sometimes there are
 > sub-options to disable the binaries). Therefore, there is no reason
 > to change the name.
 >
 > Regards, Arnout
 >



Hi,

ok, i see. Is there any policy/standards document or wikipage
somewhere which summarizes this kind of practices?
I couldn't find it so far. What i found is mostly technical kind of infos.
(which is extremly useful of course :)


best regards
Zoltan Gyarmati
