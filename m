From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 10 Jan 2014 08:13:53 +0100
Subject: [Buildroot] [PATCH v3] omniorb: add COS Naming Service
In-Reply-To: <1389029826-10415-1-git-send-email-mlweber1@rockwellcollins.com>
References: <1389029826-10415-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <52CF9DB1.4060709@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/01/14 18:37, Matt Weber wrote:
> Signed-off-by: Matt Weber<mlweber1@rockwellcollins.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>
> Changes v2 -> v3:
>   - Updated patch to be more generic and enable apps/services
>       disabled by selecting the reduced embedded build option

  You should probably have updated the commit message as well, because 
that still mentions the COS Naming Service only.


  Regards,
  Arnout

>   - Added comments in .mk to clarify what the reduced embedded
>       build configuration consisted of
>
> Changes v1 -> v2:
>   - Moved comment to top package/omniorb/Config.in (suggested by Thomas S)
>   - Removed indents of variable assigments and changed hook
>       to be a post patch hook package/omniorb/Config.in (suggested by Arnout V)
>   - Cleaned up tab/spaces package/omniorb/Config.in (suggested by Thomas P)
> ---
>   package/omniorb/Config.in  |   15 +++++++++++++--
>   package/omniorb/omniorb.mk |   15 ++++++++++++++-
>   2 files changed, 27 insertions(+), 3 deletions(-)
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
