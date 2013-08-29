From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 29 Aug 2013 18:37:37 +0200
Subject: [Buildroot] [PATCH 3 of 9 v3] Config.in.legacy: add separator
 to description for users
In-Reply-To: <240f7d7c4c60ebb1a259.1377781158@argentina>
References: <patchbomb.1377781155@argentina>
 <240f7d7c4c60ebb1a259.1377781158@argentina>
Message-ID: <521F78D1.7050309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/29/13 14:59, Thomas De Schampheleire wrote:
> When legacy symbols are selected, the menuconfig shows the explanation for
> users, immediately followed by the line "Legacy options removed in 2013.08".
> In order to visually keep these apart, we introduce a separator.
>
> Note that a line with all spaces is not correctly shown by menuconfig (the
> width will not be kept at 80 characters, so the output is '***   ***').
> A dashed line seemed a logical alternative, and with another dashed line on
> top, the description becomes a block.
>
> Signed-off-by: Thomas De Schampheleire<thomas.de.schampheleire@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


>
> ---
> This patch is pure aesthetics. I kept it as a separate patch so it can be
> rejected easily if you don't feel the same way.

  I like it!

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
