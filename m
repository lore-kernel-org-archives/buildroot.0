From: Patrick Havelange <patrick.havelange@essensium.com>
Date: Mon, 28 Jan 2019 17:47:41 +0100
Subject: [Buildroot] [PATCH 02/10] package/nut: Add support for openssl
 1.1.x
In-Reply-To: <87ef8xolri.fsf@dell.be.48ers.dk>
References: <20190125160420.10932-1-patrick.havelange@essensium.com>
 <20190125160420.10932-2-patrick.havelange@essensium.com>
 <87ef8xolri.fsf@dell.be.48ers.dk>
Message-ID: <CAKKE0ZH7b35K09+bdycT9uBuqg2j0CKWtGnKXBsmSqc2bQmTJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Thanks for the comments, those are fixed in the v7 that I'll send soon.

Patrick Havelange.


On Sun, Jan 27, 2019 at 10:04 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Patrick" == Patrick Havelange <patrick.havelange@essensium.com> writes:
>
>  > From: Vadim Kochan <vadim4j@gmail.com>
>  > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
>  > Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
>
>  > ---
>  > Changes v6:
>  >   - use the actual upstream patch
>  >   - drop unrelated patch
>  > ---
> >  ...Add-compatibility-with-openssl-1.1.0.patch | 75 +++++++++++++++++++
>  >  1 file changed, 75 insertions(+)
>  >  create mode 100644 package/nut/0003-Add-compatibility-with-openssl-1.1.0.patch
>
>  > diff --git a/package/nut/0003-Add-compatibility-with-openssl-1.1.0.patch b/package/nut/0003-Add-compatibility-with-openssl-1.1.0.patch
>  > new file mode 100644
>  > index 0000000000..65b7f2d6f7
>  > --- /dev/null
>  > +++ b/package/nut/0003-Add-compatibility-with-openssl-1.1.0.patch
>  > @@ -0,0 +1,75 @@
>  > +From fcbf18c92918ce5e81d0aab62a7aed5c2245ea4d Mon Sep 17 00:00:00 2001
>  > +From: Eneas U de Queiroz <cote2004-github@yahoo.com>
>  > +Date: Fri, 1 Jun 2018 11:17:28 -0300
>  > +Subject: [PATCH 1/2] Add compatibility with openssl 1.1.0
>
> NIT: check-package complains about PATCH n/m:
>
> package/nut/0003-Add-compatibility-with-openssl-1.1.0.patch:4: generate your patches with 'git format-patch -N'
>
> --
> Bye, Peter Korsgaard
