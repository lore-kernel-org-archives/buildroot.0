From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 May 2016 16:11:15 +0200
Subject: [Buildroot] [PATCH 1/9] package/go-bootstrap: Add toolchain
 dependency
In-Reply-To: <7254622f78c54dbcdbbca63e2fb68eed0e2355cf.1463010771.git.geoff@infradead.org>
References: <cover.1463010771.git.geoff@infradead.org>
 <7254622f78c54dbcdbbca63e2fb68eed0e2355cf.1463010771.git.geoff@infradead.org>
Message-ID: <20160512161115.5bab0597@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 May 2016 00:08:46 +0000, Geoff Levand wrote:

> +HOST_GO_BOOTSTRAP_DEPENDENCIES = toolchain

Since it's far from being obvious, I've added a comment above this
line, which says:

+# To build programs that need cgo support the toolchain needs to be
+# available, so the toolchain is not needed to build host-go-bootstrap
+# itself, but needed by other packages that depend on
+# host-go-bootstrap.

And applied your patch to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
