From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Mar 2015 21:45:56 +0100
Subject: [Buildroot] [PATCH 4/5 v2] support/download: properly catch
 missing hashes
In-Reply-To: <635ccce48b7a43df2f151481b72e6e46f2aae1a0.1426597114.git.yann.morin.1998@free.fr>
References: <cover.1426597114.git.yann.morin.1998@free.fr>
 <635ccce48b7a43df2f151481b72e6e46f2aae1a0.1426597114.git.yann.morin.1998@free.fr>
Message-ID: <550B3584.2000602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/03/15 13:59, Yann E. MORIN wrote:
> When checking hashes reports no hash for a file, and this is treated as
> an error (now: because BR2_ENFORCE_CHECK_HASH is set; later: because
> that will be the new and only behaviour), exit promptly in error.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> 
> ---
> Changes v1 -> v2:
>   - typo in commit
> ---
>  support/download/dl-wrapper | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
