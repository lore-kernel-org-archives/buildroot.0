From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 1 Sep 2015 11:57:10 +0100
Subject: [Buildroot] [PATCH 1/2] dos2unix: add target support
In-Reply-To: <d04d05bf5fb09fd02747689fe348375cdff4fc6a.1441089817.git.baruch@tkos.co.il>
References: <d04d05bf5fb09fd02747689fe348375cdff4fc6a.1441089817.git.baruch@tkos.co.il>
Message-ID: <55E58486.2000407@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach and James Knight,

On 09/01/2015 07:43 AM, Baruch Siach wrote:
> From: James Knight <james.knight@rockwellcollins.com>
> 
> Allow the `dos2unix` utility to be built and installed on the target
> system.
> 
> [baruch: properly handle target gettext]
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2:
>    * Fix static build with gettext
>    * Support build without locale support
> ---

I guess Baruch forgot to add v2 the subject line and James forgot to
mark its previous patch as superseded in Patchwork.

Regards,

Vincent.
