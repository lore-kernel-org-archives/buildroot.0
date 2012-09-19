From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Sep 2012 23:11:18 +0200
Subject: [Buildroot] [PATCH 0/11 v3] Rework the gettext handling
In-Reply-To: <1347836276-24262-1-git-send-email-yann.morin.1998@free.fr>
References: <1347836276-24262-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <505A34F6.70606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/17/12 00:57, Yann E. MORIN wrote:
> Hello All!
>
> This patch series is an aggregation of the gettext rework by Samuel,
> Maxime, Thomas, and I.
>
> See this post for the 6 first patches:
> http://lists.busybox.net/pipermail/buildroot/2012-July/055871.html
>
>      [PATCH 01/11] gettext: remove option to build statically
>      [PATCH 02/11] gettext: remove the gettext-target make target, unused
>      [PATCH 03/11] gettext: remove libintl handling
>      [PATCH 04/11] Remove all references to libintl
>      [PATCH 05/11] gettext: convert to autotools-package
>      [PATCH 06/11] doc: update after gettext changes
[snip]

  I'm still in the process of (re-)reviewing the patches, but I'm in favour
of committing 1-4 + 6 right away.  They can benefit from some autobuild
exposure before we continue with the rest.  (Note: the ordering is a bit
off, since the doc update is independent of the conversion to
autotools-package).


  Peter, do you agree?


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
