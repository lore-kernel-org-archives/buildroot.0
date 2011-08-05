From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2011 08:39:26 +0200
Subject: [Buildroot] [RFC] Using AsciiDoc for the Buildroot manual
In-Reply-To: <CAAXf6LV1MwAqHAYWPC3-W5-FN6MwgWwQmsUjmzLFUWV-mkwXmA@mail.gmail.com>
References: <cover.1312492948.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LV1MwAqHAYWPC3-W5-FN6MwgWwQmsUjmzLFUWV-mkwXmA@mail.gmail.com>
Message-ID: <20110805083926.257f81bc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le Fri, 5 Aug 2011 07:42:28 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> I'm in favor of this manual conversion. It's true that it is a bit
> annoying having to take care of the HTML.

Yeah, it is a bit painful and I hope that having a better format, with
splitted files, will encourage us to do more updates to the
documentation.

> One comment though: how will you ship buildroot? Will the generated
> manuals be included in the official tarballs?
> I think it should. Otherwise, a new user will have nothing but the
> individual txt files, which are not convenient to read directly
> because of the number of files. In order to get 'real' documentation,
> he'd already have to know that there are make targets for it, he'd
> need at least asciidoc to get a full manual.txt and possibly docbook
> to get pdf or html output.

This is a question, of course. Peter has raised the same comment on IRC
when I quickly presented the proposal, some days ago.

I agree that somehow a generated version of the documentation should be
part of the release tarballs. The generated documentation should also
be on the website, for every Buildroot release.

For the first part, I guess the "make release" target can be extended
to generate the documentation and then include it into the tarball, but
I think this is something to be discussed with Peter.

What would be great is at least to reach to a decision on whether or
not converting the documentation to AsciiDoc is desirable or not. If it
is, then I can start collecting patches to fix issues related to the
conversion or improvements to the documentation in AsciiDoc format,
waiting for the next release cycle to start to get this new
documentation format merged.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
