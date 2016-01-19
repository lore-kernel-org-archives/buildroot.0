From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 16:37:28 +0100
Subject: [Buildroot] Building a Linux from scratch and new target
 architecture
In-Reply-To: <1453201429564-122990.post@n4.nabble.com>
References: <1453201429564-122990.post@n4.nabble.com>
Message-ID: <20160119163728.3dc4953c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Jan 2016 03:03:49 -0800 (PST), ronyboss wrote:

> Recently I have been working with buildroot system and openwrt system. I

First of all, make sure to not confuse Buildroot and OpenWRT. They are
completely different projects, and internally they work completely
differently.

The OpenWRT documentation improperly calls the project "OpenWRT
Buildroot" because OpenWRT was 10+ years ago a fork of Buildroot. But
nowadays, the projects have nothing in common.

> have successfully build the linux for raspberry pi and other different
> routers with my own modifications. Now I want to learn how to add custom
> Target architecture, how to add kernel for them and how to tweek rootfs, and
> how to tweek file system and others.
> 
> So it would be helpful for me if anyone can provide me some information
> about these things.

If you're really talking about Buildroot (http://buildroot.org), then
please read the documentation at
https://buildroot.org/downloads/manual/manual.html. It gives all the
details about customizing the rootfs, adding more packages, configuring
the kernel, and more.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
