From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 22:41:28 +0100
Subject: [Buildroot] [PATCH] xorriso: new package
In-Reply-To: <54B17F87.4020002@ou.edu>
References: <54B17F87.4020002@ou.edu>
Message-ID: <20150114224128.33fa0f17@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Kenton,

On Sat, 10 Jan 2015 13:37:43 -0600, Steve Kenton wrote:
> xorriso cd/dvd/bd iso 9660 manipulation and disc burner.
> 
> libburnia is a project for reading, mastering and writing
> optical discs. Currently it is comprised of libraries named
> libisofs, libburn, libisoburn, a cdrecord emulator named cdrskin,
> and an integrated multi-session tool named xorriso.
> The software runs on GNU/Linux, FreeBSD, Solaris, NetBSD.
> It is base of the  GNU xorriso package and is actively maintained.
> 
> Signed-off-by Stephen M. Kenton <skenton@ou.edu>

Thanks, applied, after doing a number of additional changes:

[Thomas:
 - Rewrap Config.in help text
 - Add optional dependencies on libcdio, readline, acl, attr, zlib,
   bzip2.
 - Handle thread support.
 - Add hash file.]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
