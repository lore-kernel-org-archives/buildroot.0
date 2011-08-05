From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 5 Aug 2011 07:42:28 +0200
Subject: [Buildroot] [RFC] Using AsciiDoc for the Buildroot manual
In-Reply-To: <cover.1312492948.git.thomas.petazzoni@free-electrons.com>
References: <cover.1312492948.git.thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LV1MwAqHAYWPC3-W5-FN6MwgWwQmsUjmzLFUWV-mkwXmA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Thu, Aug 4, 2011 at 11:23 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> The Buildroot documentation was started by myself in December 2004
> (see commit 32fcf718f82c241e890af8c7ccc10ef6c438331a), and at that
> time the amount of documentation was relatively light, so the single
> HTML file was seen as an appropriate solution to write the
> documentation.
>
> Since then, the documentation has expanded quite a bit, and I intend
> to do some more important additions to the documentation in the near
> future, but I feel like the hand-written HTML format is a bit
> annoying.
>
> Therefore, this set of patches proposes to switch the documentation
> over to the AsciiDoc format [1]. It is a very simple text-baseda
> format, from which you can generate HTML (single page or splitted),
> PDF, text, and more.
>
> I have done an initial conversion of the Buildroot documentation to
> AsciiDoc and the result can be seen at :
>
> ?* http://free-electrons.com/~thomas/buildroot/manual/manual.pdf for
> ? the PDF version
>
> ?* http://free-electrons.com/~thomas/buildroot/manual/manual.text for
> ? the text version
>
> ?* http://free-electrons.com/~thomas/buildroot/manual/manual.html for
> ? the single page HTML version
>
> ?* http://free-electrons.com/~thomas/buildroot/manual/html/ for
> ? the multiple pages HTML version
>
> Some more improvements can quite certainly be made to the converted
> document. However, I'd prefer not to maintain it for a too long time
> together with the current documentation, so if the solution of
> AsciiDoc gets the attention of the Buildroot community, it'd be nice
> to have this merged relatively soon, or at least to not do too many
> changes to the current documentation.

I'm in favor of this manual conversion. It's true that it is a bit
annoying having to take care of the HTML.

One comment though: how will you ship buildroot? Will the generated
manuals be included in the official tarballs?
I think it should. Otherwise, a new user will have nothing but the
individual txt files, which are not convenient to read directly
because of the number of files. In order to get 'real' documentation,
he'd already have to know that there are make targets for it, he'd
need at least asciidoc to get a full manual.txt and possibly docbook
to get pdf or html output.

Best regards,
Thomas
