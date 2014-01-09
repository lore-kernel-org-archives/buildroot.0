From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 09 Jan 2014 17:59:00 +0100
Subject: [Buildroot] [PATCH 2/4] libnspr: add microblaze support
In-Reply-To: <1389198785-11923-3-git-send-email-spenser@gillilanding.com>
References: <1389198785-11923-1-git-send-email-spenser@gillilanding.com>
 <1389198785-11923-3-git-send-email-spenser@gillilanding.com>
Message-ID: <52CED554.20103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/01/14 17:33, Spenser Gilliland wrote:
> fixes autobuild failures
>
> http://autobuild.buildroot.net/results/493/4932900522e87da84a47fbf2d796c2fbb3f7e741/build-end.log
> Signed-off-by: Spenser Gilliland<spenser@gillilanding.com>
> ---
>   ...-nios2.patch => libnspr-microblaze-nios2.patch} | 59 ++++++++++++++++++++--
>   1 file changed, 56 insertions(+), 3 deletions(-)
>   rename package/libnspr/{libnspr-nios2.patch => libnspr-microblaze-nios2.patch} (59%)
>
> diff --git a/package/libnspr/libnspr-nios2.patch b/package/libnspr/libnspr-microblaze-nios2.patch
> similarity index 59%
> rename from package/libnspr/libnspr-nios2.patch
> rename to package/libnspr/libnspr-microblaze-nios2.patch

  If you're anyway renaming patches, please at a sequence number.


> index cffb2ef..a82317b 100644
> --- a/package/libnspr/libnspr-nios2.patch
> +++ b/package/libnspr/libnspr-microblaze-nios2.patch
> @@ -1,14 +1,65 @@
> -Add Nios-II support
> +Add Microblaze and Nios-II support
>
> +Signed-off-by: Spenser Gilliland<spenser@gillilanding.com>
>   Signed-off-by: Ezequiel Garcia<ezequiel@vanguardiasur.com.ar>
>

  Maybe it's better to add this as a separate patch rather than updating 
the existing patch. That will make it slightly easier to track upstream 
if either of these is ever accepted there.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
