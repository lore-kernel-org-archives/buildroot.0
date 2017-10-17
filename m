From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Oct 2017 08:51:39 +0200
Subject: [Buildroot] [buildroot] No hash found for gcc-5.4.0.tar.bz2.
In-Reply-To: <52863a95f7d742d4a1a754e66954e9d3@draper.com>
References: <e953736f09ba4dd6a73358abf69f44aa@draper.com>
 <20171016212545.78715dff@windsurf.lan>
 <52863a95f7d742d4a1a754e66954e9d3@draper.com>
Message-ID: <20171017085139.2f48ba78@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Oct 2017 20:02:26 +0000, Lim, Sungyung wrote:

> I downloaded the buildroot from the mathworks git website
> [https://github.com/mathworks/buildroot] because of familiarity with mathworks tools such as matlab.

This not the official Buildroot, so it's a bit difficult to provide
support for something we are not the author of. You should ask the
authors of this Buildroot fork, and encourage them to contribute
upstream instead.

> The .config file says
> 
> 1. buildroot 2017.02 configuration
> 2. buildroot .config was generated for zynq_zed_defconfig

From a quick look at this Buildroot, I don't see why you would get this
failure. package/gcc/gcc-initial/gcc-initial.hash is properly a symlink
to ../gcc.hash, and package/gcc/gcc.hash does contain the hash for
gcc-5.4.0.tar.bz2. So everything looks correct to me here.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
