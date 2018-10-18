From: Shaikat Hossain <shossa3@gmail.com>
Date: Thu, 18 Oct 2018 13:22:49 -0700
Subject: [Buildroot] wget: unable to resolve host address
Message-ID: <CAD8kTsDBFFwBXKKnDL+db0S4k98_qNAhcC=qT7sT8S2jExkmOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am a bit new to Linux and Buildroot so I'm a bit inexperienced. Would
anyone have any insights on how I could resolve the following error
message:

Resolving ftpmirror.gnu.org (ftpmirror.gnu.org)... failed: Name or service
not known.
wget: unable to resolve host address 'ftpmirror.gnu.org'
--2018-10-18 12:26:55-- http://sources.buildroot.net/libtool-2.4.6.tar.xz
Resolving sources.buildroot.net (sources.buildroot.net)... failed: Name or
service not known.
wget: unable to resolve host address 'sources.buildroot.net'
package/pkg-generic.mk:133: recipe for target
'/home/shaikat/erpiam/output/build/host-libtool-2.4.6/.stamp_download'
failed
make: ***
[/home/shaikat/erpiam/output/build/host-libtool-2.4.6/.stamp_download Error
1
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181018/cdd2446d/attachment.html>
