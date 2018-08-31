From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 Aug 2018 23:52:04 +0200
Subject: [Buildroot] [PATCH] coreutils: Bump version to 8.30
In-Reply-To: <20180830153818.15409-1-abrodkin@synopsys.com>
References: <20180830153818.15409-1-abrodkin@synopsys.com>
Message-ID: <20180831235204.6e0d3d08@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Aug 2018 18:38:18 +0300, Alexey Brodkin wrote:
> Among other things this is required to build aginst Glibc 2.28+,
> see:
> https://github.com/coreutils/gnulib/commit/4af4a4a71827c0bc5e0ec67af23edef4f15cee8e
> 
> Otherwise it fails on build like that:
> ----------------------->8------------------------  
>   CC       lib/fts.o
> lib/freadptr.c: In function 'freadptr':
> lib/freadptr.c:119:3: error: #error "Please port gnulib freadptr.c to your platform! Look at the definition of fflush, fread, getc, getc_unlocked on your system, then report this to bug-gnulib."
>  #error "Please port gnulib freadptr.c to your platform! Look at the definition of fflush, fread, getc, getc_unlocked on your system, then report this to bug-gnulib."
>   ^~~~~
> ----------------------->8------------------------  

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
