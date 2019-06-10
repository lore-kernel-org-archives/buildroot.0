From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 10 Jun 2019 16:31:18 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/libgit2: security bump to version 0.27.8
In-Reply-To: <da7b22b8-e16a-0cc1-ca76-480647c85aca@mind.be>
References: <20190610090328.28495-1-fontaine.fabrice@gmail.com>
 <da7b22b8-e16a-0cc1-ca76-480647c85aca@mind.be>
Message-ID: <CAPi7W80c-NtDxfRM6v28nJ1x5pGO1Vn29A3x0rZm2rPpkMNWgg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lun. 10 juin 2019 ? 16:24, Arnout Vandecappelle <arnout@mind.be> a ?crit :
>
>
>
> On 10/06/2019 11:03, Fabrice Fontaine wrote:
> > Fixing the following list of issues (fixed in 0.27.6 and 0.27.5):
>
>  Applied to master, thanks.
>
>  For the decision of backporting to 2019.0[25].x, though: you only mention fixes
> in 0.27.5 and 0.27.6, not in .7 or .8. So does that mean that the stable
> branches should update only to 0.27.6?
I did not see any security fixes in the ChangeLog of 0.27.7 or 0.27.8
but nonetheless they contain bug fixes not related to security so I
think stable branches should also bump to 0.27.8.
>
>  Regards,
>  Arnout
>
> [snip]
Best Regards,

Fabrice
