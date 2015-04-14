From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Apr 2015 21:34:42 +0200
Subject: [Buildroot] [PATCHv2 09/21] pkg-download: remove support for
 the SHOW_EXTERNAL_DEPS DL_MODE
In-Reply-To: <1428856685-4403-10-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-10-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <552D6BD2.3040501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/04/15 18:37, Thomas Petazzoni wrote:
> Now that the external-deps implementation relies on the per-package
> <pkg>-all-external-deps and <pkg>-external-deps targets and no longer
> on the 'source' target with a custom DL_MODE, we can get rid of the
> support for the SHOW_EXTERNAL_DEPS DL_MODE value in the pkg-download
> logic.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 I also wanted to add my Tested-by, but it currently fails due to the
rootfs-ubifs dependency.

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
