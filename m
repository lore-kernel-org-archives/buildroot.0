From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Nov 2012 22:47:34 +0100
Subject: [Buildroot] [PATCH v2 5/6] bluez-utils: add cg2900 support for
 snowball board
In-Reply-To: <1352742102-19010-6-git-send-email-gregory.hermant@calao-systems.com>
References: <1352742102-19010-1-git-send-email-gregory.hermant@calao-systems.com>
 <1352742102-19010-6-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <50A16E76.3030006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/12/12 18:41, Gregory Hermant wrote:
>
> Signed-off-by: Gregory Hermant<gregory.hermant@calao-systems.com>
> ---
>   ...an_patches_enable_cg2900_on_upstream_4.91.patch |   88 ++++++++++++++++++++
>   1 file changed, 88 insertions(+)
>   create mode 100644 package/bluez_utils/bluez_utils-4.101-debian_patches_enable_cg2900_on_upstream_4.91.patch
>
> diff --git a/package/bluez_utils/bluez_utils-4.101-debian_patches_enable_cg2900_on_upstream_4.91.patch b/package/bluez_utils/bluez_utils-4.101-debian_patches_enable_cg2900_on_upstream_4.91.patch
> new file mode 100644
> index 0000000..02b84c4
> --- /dev/null
> +++ b/package/bluez_utils/bluez_utils-4.101-debian_patches_enable_cg2900_on_upstream_4.91.patch
> @@ -0,0 +1,88 @@

  The patch file should have a description that explains why the patch is needed,
and where you got it from (i.e. similar to a commit message).  It should also
have your Signed-off-by.

[snip]

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
