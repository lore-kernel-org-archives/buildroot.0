From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 12 Dec 2013 23:25:59 +0100
Subject: [Buildroot] [PATCH 1/2] pkg-generick.mk: support for multiple
 patch dirs
In-Reply-To: <1386838290-10978-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1386838290-10978-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <52AA37F7.9000908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Ryan,

  Oops, looks like I replied to an old version of this patch - but my 
comment still stands.

  Your title "pkg-generick.mk" sounds a bit special :-)

  When you post updated versions of a patch (series), could you add v2 to 
it (recent git allows you to do that with the '-v2' argument to 
send-email or format-patch, older versions need '--subject-prefix='PATCH 
v2' ).

  Regards,
  Arnout

On 12/12/13 09:51, Ryan Barnett wrote:
> Adding support for specifying multiple directories in
> BR2_GLOBAL_PATCH_DIR. This will allow for a layered approach for the
> patching of a package.
>
> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
