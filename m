From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Oct 2018 00:10:16 +0100
Subject: [Buildroot] wget: unable to resolve host address
In-Reply-To: <CAD8kTsDBFFwBXKKnDL+db0S4k98_qNAhcC=qT7sT8S2jExkmOQ@mail.gmail.com>
References: <CAD8kTsDBFFwBXKKnDL+db0S4k98_qNAhcC=qT7sT8S2jExkmOQ@mail.gmail.com>
Message-ID: <bb7a2783-102b-7a85-0bf1-0b23e25fda1c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/18/18 9:22 PM, Shaikat Hossain wrote:
> Hello,?
> 
> I am a bit new to Linux and Buildroot so I'm a bit inexperienced. Would anyone
> have any insights on how I could resolve the following error message:?
> 
> Resolving ftpmirror.gnu.org <http://ftpmirror.gnu.org> (ftpmirror.gnu.org
> <http://ftpmirror.gnu.org>)... failed: Name or service not known. 

 You have a problem with your network, it can't resolve host names. You're
probably running inside a VM that is not configured correctly.

 Regards,
 Arnout

> wget: unable to resolve host address 'ftpmirror.gnu.org <http://ftpmirror.gnu.org>'
> --2018-10-18 12:26:55-- http://sources.buildroot.net/libtool-2.4.6.tar.xz
> Resolving sources.buildroot.net <http://sources.buildroot.net>
> (sources.buildroot.net <http://sources.buildroot.net>)... failed: Name or
> service not known.?
> wget: unable to resolve host address 'sources.buildroot.net
> <http://sources.buildroot.net>'
> package/pkg-generic.mk:133 <http://pkg-generic.mk:133>: recipe for target
> '/home/shaikat/erpiam/output/build/host-libtool-2.4.6/.stamp_download' failed?
> make: *** [/home/shaikat/erpiam/output/build/host-libtool-2.4.6/.stamp_download
> Error 1?
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
