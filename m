From: Brian Beattie <beattie@beattie-home.net>
Date: Wed, 30 Jul 2008 17:16:00 -0700
Subject: [Buildroot] buildroot failing when jffs2 output selected
In-Reply-To: <1217457837.6526.6.camel@kokopelli>
References: <1217457837.6526.6.camel@kokopelli>
Message-ID: <1217463360.6526.13.camel@kokopelli>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2008-07-30 at 15:43 -0700, Brian Beattie wrote:
> I'm trying the build a jffs2 filesystem but buildroot fails when trying
> the build the host utilities with a missing include file "acl.h" 

I've been looking at the mtd-utils and it looks like
for .../buildroot/toolchain_build_arm/mtd_orig, not all the patches are
getting applied.  Maybe somebody who understands patch-kernel.sh better
than I could comment?

-- 
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting a bad thing?

Brian Beattie   LFS12947 | "Honor isn't about making the right choices.
beattie at beattie-home.net | It's about dealing with the consequences."
www.beattie-home.net     | -- Midori Koto
