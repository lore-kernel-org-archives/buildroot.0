From: Stefan Becker <chemobejk@gmail.com>
Date: Sat, 30 Jun 2018 19:50:34 +0300
Subject: [Buildroot] [PATCHv2] core/sdk: generate the SDK tarball
 ourselves
In-Reply-To: <20180630163849.GE2384@scaer>
References: <20180630135645.2956-1-yann.morin.1998@free.fr>
 <CAOJ2eMf9iAP4kgqPWv2HwD0hBvzeWD7H7xONh0dZtDO1FoY=MQ@mail.gmail.com>
 <20180630163849.GE2384@scaer>
Message-ID: <CAOJ2eMfbHOu2_VJoYJQc+7+u_K-Ojs44+sfVttnujF+oXe7_aw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

On Sat, Jun 30, 2018 at 7:38 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Well, on my side, I *do* want an artefact that is versioned, so that I
> am sure users do not extract a new one over a previous one, so that they
> can work on different versions at the same time.

Sorry, but the SW build system is the wrong place to generate the
versioned artefact.

> Versionned artefacts are a requirement for some people.

I agree. But again you hard-code your versioning scheme instead of
letting the user decide what versioning scheme is appropriate for
his/her use case when she/he exports the build artefact from the
automated build system to his/her "versioned storage system".

> But now, I took *all* the feedback for the first iteration, to provide a
> situation that works for everyone. If the discussion on this new patch
> makes it that the maintainer do not want it in the end, then fine.

This new patch set (with small improvements) is acceptable and I will
not vote against it.

But IMHO the implemented functionality is pretty useless, i.e. all SDK
users will switch to 'prepare-sdk' instead.

Regards, Stefan
