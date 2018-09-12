From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 22:53:32 +0200
Subject: [Buildroot] [PATCH 06/18] perl-sys-cpu: new package
In-Reply-To: <20180820115519.24046-7-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
 <20180820115519.24046-7-chrismcc@gmail.com>
Message-ID: <20180912225332.3147a1dd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 04:55:07 -0700, Christopher McCrory wrote:
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>

I've applied, but I have a number of questions/suggestions again:

 (1) This package builds some native code (CPU.xs), but it doesn't have
     the !BR2_STATIC_LIBS dependency. Is this expected ?

 (2) The README file says "For more details, see the full text of the
     licenses in the directory LICENSES", but there is no such
     directory. Could you report this upstream?

 (3) https://github.com/mzsanford/perl-sys-cpu is a Github repo with
     slightly more recent version. The name of the author "mzsanford"
     is the same as the one listed at
     https://metacpan.org/pod/release/MKODERER/Sys-CPU-0.52/CPU.pm.
     Maybe you should contact the upstream author to report (2) and ask
     to update CPAN with the latest version of the module ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
