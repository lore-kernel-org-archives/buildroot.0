From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 01 Nov 2012 15:26:29 +0100
Subject: [Buildroot] [PATCH 10/10] libsoup: remove redundant dependency
 on gettext
In-Reply-To: <201210142324.20324.yann.morin.1998@free.fr>
References: <20121014210734.17845.64519.stgit@localhost>
 <20121014211121.17845.45817.stgit@localhost>
 <201210142324.20324.yann.morin.1998@free.fr>
Message-ID: <50928695.4070307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/14/12 23:24, Yann E. MORIN wrote:
> Or maybe you meant that gettext is needed by libglib2, not by libsoup
> itself? In which case you want to remove the select altogether.

  In fact, libsoup doesn't use libintl directly, but does use gi18n.  So
I guess the dependency can indeed be removed.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
