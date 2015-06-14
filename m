From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 14:52:10 +0200
Subject: [Buildroot] [PATCH 2/2] uclibc: remove Xtensa specific version
In-Reply-To: <1434216106-27618-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1434216106-27618-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1434216106-27618-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150614145210.2e29a2c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 13 Jun 2015 19:21:46 +0200, Thomas Petazzoni wrote:
> Since we now have uClibc-ng, and it is used as the default uClibc
> version, there is no real need to keep the Xtensa version: this
> version is just a specific Git revision of uClibc master branch, and
> uClibc-ng is also based on uClibc master branch.
> 
> In addition, since in the choice of uClibc versions, uClibc-ng is
> already *before* the Xtensa specific version, uClibc-ng has in fact
> already been the default uClibc version for Xtensa since uClibc-ng
> support was introduced.
> 
> See for example:
> 
>   http://autobuild.buildroot.org/results/c85/c854fae31d82e0f11d5a8b5bfc196c29bd7e21db/config
> 
> for a build on Xtensa with the internal toolchain, where in fact
> uClibc-ng is used instead of the Xtensa specific version.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: Waldemar Brodkorb <wbx@openadk.org>

As suggested by Max, I've also removed the no-longer needed Xtensa
specific patch directory, and applied.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
