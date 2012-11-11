From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Nov 2012 23:47:40 +0100
Subject: [Buildroot] Various problem using buildroot-2012.05
In-Reply-To: <509E69FD.2000804@petroprogram.com>
References: <1340005565.16617.YahooMailClassic@web161402.mail.bf1.yahoo.com>
 <20120618103657.721db39b@skate> <qaol7k.eta.ln@bernd-kuhls.de>
 <509E69FD.2000804@petroprogram.com>
Message-ID: <50A02B0C.4000107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/10/12 15:51, Stefan Fr?berg wrote:
>
> If you try to use buildroot-made target gcc to compile perl, that is, you use buildroot to cross-compile gcc to run
> natively inside
> uClibc (?) environment, then you might encounter problems.
>
> As Thomas has said in few times here for people telling about problems of native gcc-toolchain, buildroot is about
> cross-compiling stuff
> and buildroot produced native gcc-toolchain is really not supported and might be still broken
> (I don't know what the current status of it is now).

  The current status is: we're going to remove it.  Thomas has just posted some
patches to do that.

  The idea is: if you need a toolchain on the target, there is no reason not to
use a normal distro: debian, ubuntu, gentoo, ....


  As for perl, however, I think we really would like to be able to cross-compile
perl modules.  But that unfortunately still needs some work.  I messed about
with it for a bit, but I can't say I really understand how the perl build system
works.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
