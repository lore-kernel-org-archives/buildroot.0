From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 02 Apr 2015 22:31:42 +0200
Subject: [Buildroot] [PATCH] docs: add links to the rest of the licenses
In-Reply-To: <1428002345-12265-1-git-send-email-yegorslists@googlemail.com>
References: <1428002345-12265-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <551DA72E.7030903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/04/15 21:19, Yegor Yefremov wrote:
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  docs/manual/legal-notice.txt | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
> index 7b17438..5895224 100644
> --- a/docs/manual/legal-notice.txt
> +++ b/docs/manual/legal-notice.txt
> @@ -115,10 +115,18 @@ Buildroot, with the name used in the manifest files:
>  * `LGPL`:
>    http://www.gnu.org/licenses/lgpl.html[
>    GNU Lesser General Public License] (any version);
> -* `BSD-4c`: Original BSD 4-clause license;
> -* `BSD-3c`: BSD 3-clause license;
> -* `BSD-2c`: BSD 2-clause license;
> -* `MIT`: MIT-style license.
> +* `BSD-4c`:
> +  http://directory.fsf.org/wiki/License:BSD_4Clause[
> +  Original BSD 4-clause license];
> +* `BSD-3c`:
> +  http://opensource.org/licenses/BSD-3-Clause[

 I wonder if, for consistency, it wouldn't be better to refer to the fsf page
for all BSD variants.

 But unfortunately, it doesn't have the 2c variant, so there's no one ring to
rule them all...

 Therefore, it's good to go as it is:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> +  BSD 3-clause license];
> +* `BSD-2c`:
> +  http://opensource.org/licenses/BSD-2-Clause[
> +  BSD 2-clause license];
> +* `MIT`:
> +  http://opensource.org/licenses/mit-license.html[
> +  MIT-style license];
>  * `Apache-2.0`:
>    http://apache.org/licenses/LICENSE-2.0.html[
>    Apache License, version 2.0];
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
