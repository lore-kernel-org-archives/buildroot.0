From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 23:17:36 +0100
Subject: [Buildroot] [PATCH 3/4 v3] core/pkg-generic: store
 file->package list for staging and host too
In-Reply-To: <31dc17f2b1318c61f33d73e86fea48f38698360f.1509204637.git.yann.morin.1998@free.fr>
References: <cover.1509204637.git.yann.morin.1998@free.fr>
 <31dc17f2b1318c61f33d73e86fea48f38698360f.1509204637.git.yann.morin.1998@free.fr>
Message-ID: <20171127231736.1f97c3f3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Oct 2017 17:30:58 +0200, Yann E. MORIN wrote:

> -# This hook will be called after the target installation of a
> -# package. We store in a file named .br_filelist_after the list of
> -# files (and their MD5) currently installed in the target. We then do
> -# a diff with the .br_filelist_before to compute the list of files
> -# installed by this package.
> +# This hook will be called after the installation of a package. We store in
> +# a file named .br_filelist_after the list of files (and their MD5) currently
> +# installed. We then do a diff with the .br_filelist_before to compute the
> +# list of files installed by this package.
> +# The suffix is typically for the target variant, for legacy backward

The suffix is typically *empty*

Applied to next with this fixed!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
