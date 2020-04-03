From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Fri, 3 Apr 2020 09:11:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/cegui: fix invalid cast
In-Reply-To: <87blo97djo.fsf@dell.be.48ers.dk>
References: <20200402161759.724740-1-b.bilas@grinn-global.com>
 <87blo97djo.fsf@dell.be.48ers.dk>
Message-ID: <1ce63cff-5da8-08c2-92d6-26ae30dc451c@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On 03.04.2020 00:01, Peter Korsgaard wrote:
>>>>>> "Bartosz" == Bartosz Bilas <b.bilas@grinn-global.com> writes:
>   > Fixes:
>   > - http://autobuild.buildroot.net/results/a76/a76e88d1805c836bf095b9b6ed5fb52aa0fcdc0a
>   > - http://autobuild.buildroot.net/results/d24/d24ebb999215a23e0743c29ca137745417316bc4
>   > - http://autobuild.buildroot.net/results/37b/37b46d25a98a17ead9133cba9fd6c8ebe8996d60
>
>   > and many many more...
>
>   > Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
>   > ---
>   >  ...tringTranscoder.cpp-use-cast-notatio.patch | 34 +++++++++++++++++++
>   >  1 file changed, 34 insertions(+)
>   >  create mode 100644 package/cegui/0002-cegui-src-IconvStringTranscoder.cpp-use-cast-notatio.patch
>
>   > diff --git
>   > a/package/cegui/0002-cegui-src-IconvStringTranscoder.cpp-use-cast-notatio.patch
>   > b/package/cegui/0002-cegui-src-IconvStringTranscoder.cpp-use-cast-notatio.patch
>   > new file mode 100644
>   > index 0000000000..4dbdafb079
>   > --- /dev/null
>   > +++ b/package/cegui/0002-cegui-src-IconvStringTranscoder.cpp-use-cast-notatio.patch
>   > @@ -0,0 +1,34 @@
>   > +From 4561bac9dddad8fd79e746ea1ddd89c20647a162 Mon Sep 17 00:00:00 2001
>   > +From: Bartosz Bilas <b.bilas@grinn-global.com>
>   > +Date: Thu, 2 Apr 2020 18:04:28 +0200
>   > +Subject: [PATCH 1/1] cegui/src/IconvStringTranscoder.cpp: use cast notation
>
> Please use the -N option to git format-patch to get rid of the 1/1 as
> pointed out by check-package:
>
> package/cegui/0002-cegui-src-IconvStringTranscoder.cpp-use-cast-notatio.patch:4: generate your patches with 'git format-patch -N'
I'll keep it in my mind ;)
>
> Committed with that fixed, thanks. Do not forget to submit the patch
> upstream.
>
That's already done.


Best
Bartek
