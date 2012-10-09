From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 09 Oct 2012 22:46:48 +0200
Subject: [Buildroot] rpm5
In-Reply-To: <1349695691.6518.2.camel@localhost>
References: <1349695691.6518.2.camel@localhost>
Message-ID: <50748D38.6000101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/10/12 13:28, Alexander Khryukin wrote:
> Full log
> http://pastie.org/4932495

  It would be more relevant to post
/home/fdkit/buildroot/output/build/rpm-5.2.0/config.log

  Also please post the file 'defconfig' which is generated when you do
'make savedefconfig'.  This will allow us to try to reproduce.

  Also can you mention which BR version you're using?

  However, before doing any of that, do a 'make clean' and recompile
to see if that fixes your problem.

  (It works for me, BTW).

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
