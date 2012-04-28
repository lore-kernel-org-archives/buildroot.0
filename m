From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 28 Apr 2012 16:13:20 +0200
Subject: [Buildroot] How do you add to library path?
In-Reply-To: <CAC1BbcTQVqrFCwCz4_kSnUtHuKVB4Diw4H7iR+N=XyNFKjg_mA@mail.gmail.com>
References: <jnc1d9$t1p$1@dough.gmane.org>
 <201204280544.24157.minimod@morethan.org>
 <CAC1BbcTQVqrFCwCz4_kSnUtHuKVB4Diw4H7iR+N=XyNFKjg_mA@mail.gmail.com>
Message-ID: <201204281613.21107.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 28 April 2012 13:15:05 Bernhard Reutner-Fischer wrote:
> There is chpath (sp?) to change the rpath later on.

 Nice one!  It's called chrpath and is part of Debian [1] and Ubuntu.  The upstream seems to have vanished.

 There's also patchelf [2] which has a git repository.

 As to objcopy: I didn't find anything in the man page...

 Regards,
 Arnout

[1] http://packages.debian.org/source/sid/chrpath
[2] http://nixos.org/patchelf.html
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
