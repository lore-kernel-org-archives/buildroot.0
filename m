From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Mar 2016 21:49:59 +0100
Subject: [Buildroot] [PATCH 0/4] Add go language support
In-Reply-To: <cover.1456946494.git.geoff@infradead.org>
References: <cover.1456946494.git.geoff@infradead.org>
Message-ID: <20160302214959.419006f6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Geoff,

On Wed, 02 Mar 2016 19:23:33 +0000, Geoff Levand wrote:

> This series add support for the go programming language.  I tested the build of
> the included flannel package on i386, powerpc64, arm (32 bit) and arm64.  I did
> runtime testing of the generated flannel binary on arm64.
> 
> Patch 1 adds a host only bootstrap compiler needed to build the latest go
> versions.  The host and target support can be build independently, but either
> of the two need this bootstrap package.
> 
> Patch 2 adds support for a host cross compiler, libraries and tools.
> 
> Patch 3 adds support for a native compiler, libraries and tools for the target.
> 
> Patch 4 add a go language package flannel that can be used to test the go
> compiler.

Thanks a lot for this submission!

However, we already have some pending Go-related packages in our patch
queue. What I would like to see is a single patch series adding Go
support, which is approved by the different developers interested in Go
support in Buildroot.

The other Go patch series are:

  http://lists.busybox.net/pipermail/buildroot/2016-February/151550.html
  (from Ludovic Guegan)

  http://patchwork.ozlabs.org/patch/542108/
  (from Christian Stewart)

I have Cc'ed Ludovic and Christian. It would be good if you could sync
with them.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
