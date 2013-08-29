From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 29 Aug 2013 18:19:21 +0200
Subject: [Buildroot] [PATCH 1 of 9 v3] Config.in.legacy: update
	description for developers
In-Reply-To: <30166143137061989737.1377781156@argentina>
References: <patchbomb.1377781155@argentina>
 <30166143137061989737.1377781156@argentina>
Message-ID: <521F7489.4060703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/29/13 14:59, Thomas De Schampheleire wrote:
> The existing comments in Config.in.legacy are not entirely in-line with
> current practice. The comments implies that BR2_LEGACY should not be set when
> the conversion from old-to-new symbol can be done automatically using the
> appropriate 'select' statements. However, none of the existing legacy options
> does it this way. Moreover, I think it's intentional that the user is notified
> of the change, so that the removal of the legacy options in later buildroot
> versions no longer poses a problem.
> Additionally, the comments now describe how to handle string options.
>
> Signed-off-by: Thomas De Schampheleire<thomas.de.schampheleire@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


  Regards,
  Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
