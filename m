From: Zygmunt Ptak <zygmuntptak@gmail.com>
Date: Thu, 25 Aug 2016 12:39:05 +0200
Subject: [Buildroot] Clone source code recursively
In-Reply-To: <20160825101714.4cb710e9@free-electrons.com>
References: <CAMkMO5mqkfSz8ky1Ry05m2Z3aT9PXsNiNSjFvNMpu87GCnx03Q@mail.gmail.com>
 <20160825101714.4cb710e9@free-electrons.com>
Message-ID: <CAMkMO5=T9OtnDD-5Y8qu6ViAx=Cedze3WNmUus=_QiT=n+7vZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> What do you call "recursively"? Are you talking about also fetching
submodules?
Exactly.

Thank you for information.
About nightly manual, yeah I saw that from Arnout email.

Regards
Zygmunt

2016-08-25 10:17 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Thu, 25 Aug 2016 01:31:41 +0200, Zygmunt Ptak wrote:
>
> > I can't find how can I clone code recursively from git repository.
> > Is it possible at all?
>
> What do you call "recursively"? Are you talking about also fetching
> submodules? If that's what you're talking about, we recently added
> support for that:
>
>   https://git.buildroot.org/buildroot/commit/package/pkg-generic.mk?id=
> ec3e057f79117d851c37f19316a3b9b5e2470550
>
> You just need to add:
>
>   FOO_GIT_SUBMODULES = YES
>
> in your package .mk file.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160825/b93eb554/attachment.html>
