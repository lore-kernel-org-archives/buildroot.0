From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Mon, 21 Feb 2011 21:28:32 +0100
Subject: [Buildroot] Saving custom configs to buildroot, linux, uclibc,
	...
In-Reply-To: <AANLkTimThq-otAmyU+UYWs6EHg6zfjXqv669OzrpE=Xd@mail.gmail.com>
References: <AANLkTimThq-otAmyU+UYWs6EHg6zfjXqv669OzrpE=Xd@mail.gmail.com>
Message-ID: <AANLkTinK3Y2T8_Bd9_ikamAMCN1iUVx241RObVV_0uZ5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/2/21 Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>:
> For a certain project, I have custom configuration files for buildroot
> itself (defconfig), for the Linux kernel, and for uClibc. In buildroot
> 2010.05, these files would reside in the
> target/device/<manufacturer>/<board> directory. These files would be
> under version control in my repository.

[snip]

> However, the feature is actually generic, and could be implemented in
> a common location.
> Is there already an implementation? I have seen there is a
> 'savedefconfig' target, but this only targets the buildroot
> configuration, not the kernel nor uclibc.
> What do you think about such a build target?

Not sure I fully understood your circumstances, but any progress
making Buildroot a bit more product-centric would get my thumbs-up.

In my use-case I will be building the complete firmware for a couple
of products using Buildroot, and my dream scenario would be "make
myproductname" to use any custom configs (br, bb, uclibc, kernel) for
that product.

Not sure how to get there myself yet, but I would support any work on it.
