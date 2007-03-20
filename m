From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 20 Mar 2007 20:05:41 +0100
Subject: [Buildroot] Error patching kernel for headers
In-Reply-To: <20070320190421.GA29210@reid1.localdomain>
References: <20070320190421.GA29210@reid1.localdomain>
Message-ID: <20070320190541.GD24948@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 20, 2007 at 12:04:21PM -0700, don wrote:
>With current svn files, I get these errors.  It looks like there is a
>problem with a patch file (linux-2.6.20.3-ipmisensors-20070314-1214.patch)
>in the kernel-headers stuff.

No, the patch is fine
Sounds like you touched the kernel tarball, so it tries to re-apply all
patches.
rm -rf build_i486/linux-2.6.20.3
and don't touch the tarball
