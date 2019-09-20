From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Sep 2019 10:05:54 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-09-18
In-Reply-To: <159c1b77-d546-6283-c5a7-e45695057182@eu.citrix.com>
References: <20190919061247.E640B867ED@whitealder.osuosl.org>
 <159c1b77-d546-6283-c5a7-e45695057182@eu.citrix.com>
Message-ID: <20190920100554.2e7d6b66@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 20 Sep 2019 08:41:17 +0100
Simon Rowe <simon.rowe@eu.citrix.com> wrote:

> On 19/09/2019 07:12, Thomas Petazzoni wrote:
> 
> >     x86_64    |  openvmtools-10.3.5-10430147   | NOK |http://autobuild.buildroot.net/results/7026426bebef0de3d0cbe0d683e78ebe8255e6ed  |  
> 
> This isn't caused directly by my changeset, to build this package with 
> musl requires some ugly patches that I haven't tested with other C 
> libraries.

The issue building with musl was already investigated by Baruch, and
reported upstream at https://github.com/vmware/open-vm-tools/issues/359.

For the time being, I suggest we simply disable openvmtools when the
musl C library is used.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
