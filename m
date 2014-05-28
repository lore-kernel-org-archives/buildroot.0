From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 May 2014 18:02:44 +0200
Subject: [Buildroot] [PATCH 2/2] docs: Added referenc to EUPL
In-Reply-To: <1401005324-10428-1-git-send-email-oli.vogt.pub01@gmail.com>
References: <1401005324-10428-1-git-send-email-oli.vogt.pub01@gmail.com>
Message-ID: <538608A4.8050104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Olli,

 It would make more sense to submit this patch as part of a series adding a
package that actually uses the license.

 Also:

On 25/05/14 10:08, oli vogt wrote:
> The first European Union Public Licence
> 
> Signed-off-by: oli vogt <oli.vogt.pub01@gmail.com>
> ---
>  docs/manual/legal-notice.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
> index d4344b9..42a4a52 100644
> --- a/docs/manual/legal-notice.txt
> +++ b/docs/manual/legal-notice.txt
> @@ -122,6 +122,9 @@ Buildroot, with the name used in the manifest files:
>  * `Apache-2.0`:
>    http://apache.org/licenses/LICENSE-2.0.html[
>    Apache License, version 2.0];
> +* `EUPL-1`:

 spdx.org has EUPL-1.0 and EUPL-1.1. I expect only EUPL-1.1 is relevant.

> +  http://ec.europa.eu/idabc/eupl.html[
> +   The first European Union Public Licence];

 "The first"? The website refers to it as v1.1. So I'd call it

European Union Public License, version 1.1


 Regards,
 Arnout

>  
>  == Complying with the Buildroot license
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
