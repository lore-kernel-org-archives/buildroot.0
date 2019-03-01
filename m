From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 1 Mar 2019 17:33:18 +0200
Subject: [Buildroot] Bazel integration in buildroot
In-Reply-To: <20190301121938.GA21608@lwo1-lhp-f71841>
References: <CALFsTFU49uLC3aW+O62_oqa2v-tGeT8ZEqMpRjybSBcy4eGSWQ@mail.gmail.com>
 <20190301121938.GA21608@lwo1-lhp-f71841>
Message-ID: <CALFsTFWqzGmcVBEjh7OMq7K2hfQCNOp_RtUbeuT2vVPSnYq9+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vadim,

On Fri, Mar 1, 2019 at 2:19 PM Vadym Kochan <vadim4j@gmail.com> wrote:
>
> Hi Asaf,
>
> On Sun, Feb 24, 2019 at 06:24:40PM +0200, Asaf Kahlon wrote:
> > Hello,
> >
> > At my work we started a process in which we want to choose a construction
> > tool for our packages. Of course all the traditionals are on the list like
> > cmake, meson and others, but we're also looking at Bazel from Google.
> > All in all, Bazel seems like a nice construction tool, but I noticed that
> > there's not even one package in Buildroot that compiles with Bazel and I
> > wanted to know if we missed something. Is someone here familiar with this
> > build system and can elaborate more details on Bazel in the embedded world
> > and specifically in Buildroot?
> >
> > Regards,
> > Asaf.
>
> First of all I am not an expert, but I have some thoughts about this:)
>
> It looks like bazel is a Java application ? if so, then there will one
> more (I think big) dependency like Java on the host to build the bazel's
> packages, or it may be built by openjdk buildroot's package (which is
> not merged yet). Actually, bazel packages support might be added for local
> usages only.
>
> Anyway it is better if some of the buildroot experts can answer this question.
>
> Regards,
> Vadim Kochan

Thanks for the response!
I think too it would require a non-trivial change.
I'll be happy to hear from other Buildroot experts too.

Thanks,
Asaf.
