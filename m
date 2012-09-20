From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 21 Sep 2012 00:21:25 +0200
Subject: [Buildroot] [PATCH 09/11] toolchain/common: rename
	BR2_NEEDS_GETTEXT
In-Reply-To: <1347836276-24262-10-git-send-email-yann.morin.1998@free.fr>
References: <1347836276-24262-1-git-send-email-yann.morin.1998@free.fr>
 <1347836276-24262-10-git-send-email-yann.morin.1998@free.fr>
Message-ID: <505B96E5.2060807@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/17/12 00:57, Yann E. MORIN wrote:
> Rename the BR2_NEEDS_GETTEXT variable to a more explanatory name,
> BR2_NEEDS_EXTERNAL_GETTEXT.
>
> Update manual and all packages accordingly.
>
> Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>
> Tested-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>
> Acked-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>
> CC: Samuel Martin<s.martin49@gmail.com>

  I don't think this one needs to be delayed either, right?  Peter, Thomas?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
