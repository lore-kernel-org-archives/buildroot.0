From: Norbert Lange <nolange79@gmail.com>
Date: Sun, 7 Jun 2020 00:29:59 +0200
Subject: [Buildroot] [PATCH] package/libxml-parser-perl: make host build
 use correct compiler
In-Reply-To: <20200606220456.12fed0b1@windsurf>
References: <20200605225812.13944-1-nolange79@gmail.com>
 <20200606220456.12fed0b1@windsurf>
Message-ID: <CADYdroM-KRu5foedcafU8WogfgEJCmMQbk5XYgMv2dDrkf2y7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sa., 6. Juni 2020 um 22:04 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Sat,  6 Jun 2020 00:58:12 +0200
> Norbert Lange <nolange79@gmail.com> wrote:
>
> > This package uses gcc filename without path, which breaks the host build
> > if host and target compiler have the same filename.
>
> How is it possible for the host and target compilers to have the same
> file name ?

I use crosstool for a x86_64 target compiler, same architecture as my
desktop pc.

>
> > We pack the HOST variables as override so absolute paths are used for
> > the host tools.
>
> I'm not sure what you mean by "we pack the HOST variables".
>
> Note: I do understand that the patch will ensure that the compiler
> point by $(HOSTCC) will be used, instead of whatever default the
> libxml-parser-perl build system thinks it should use. But your commit
> log is very confusing.
>
> Also, your Signed-off-by is missing.

Was using  git send-email blindly without checking, sorry.

>
> Could you resend, with a clarified explanation, and your SoB added ?

Done.

On an not entirely unrelated note, I got troubles getting into patchwork,
did reset my PW 2-3 time, still can't log in. Is there some hidden 8
letter limit or similar?

Norbert
