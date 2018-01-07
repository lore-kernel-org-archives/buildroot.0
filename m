From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 23:42:26 +0100
Subject: [Buildroot] [PATCH] nilfs-utils: fix build with static
 toolchains
In-Reply-To: <20180107232900.63de8126@windsurf>
References: <1515357573-10780-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <20180107232900.63de8126@windsurf>
Message-ID: <20180107234226.27471e8a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 7 Jan 2018 23:29:00 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun,  7 Jan 2018 21:39:33 +0100, Kurt Van Dijck wrote:
> > This commit adds a patch to respect the dependency libmount->libblkid->libuuid
> > properly in autoconf. This becomes necessary for static builds.
> > 
> > Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>  
> 
> Nit: when sending a new version of a patch, it is strongly recommended
> to use [PATCH v2], [PATCH v3], and include a changelog...

Also, when you're fixing autobuilder failures, your commit log should
include a reference to one such failure. Something like this:

Fixes:

  http://autobuild.buildroot.org/results/<hash>/

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
