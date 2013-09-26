From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 26 Sep 2013 23:09:56 +0200
Subject: [Buildroot] custom application
In-Reply-To: <OF9ADA6F51.A3CB613B-ON85257BF2.0068F0A1-85257BF2.00693830@LocalDomain>
References: <OF9ADA6F51.A3CB613B-ON85257BF2.0068F0A1-85257BF2.00693830@LocalDomain>
Message-ID: <5244A2A4.8010206@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Naitik Amin wrote:
> Hi there,
>
> I recently used buildroot to setup my build environment, to generate 
> uboot, kernel and rootfs. It has been very helpful.
>
> Now I am at a point, where I would like to add my custom application. 
> Does the framework allow to create skeletals for applications ? Which 
> gets compiled and be made part of rootfs by doing top level make.

Of course you can!
The Buildroot manual has a detail explanation of how you can do it.
See section 6.2, "Adding new packages to Buildroot"
(http://buildroot.net/downloads/manual/manual.html#adding-packages).

Luca
