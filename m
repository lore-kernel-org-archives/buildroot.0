From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Oct 2013 22:54:54 +0200
Subject: [Buildroot] [PATCH] package/Config.in: order alphabetically
In-Reply-To: <2fd3fbf902d87dab33eb.1380096103@argentina> (Thomas De
 Schampheleire's message of "Wed, 25 Sep 2013 10:01:43 +0200")
References: <2fd3fbf902d87dab33eb.1380096103@argentina>
Message-ID: <87siwece75.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 Thomas> Even though new packages are normally added in the right
 Thomas> alphabetical order, there still remain quite a number of
 Thomas> incorrect orderings in package/Config.in.  In this patch,
 Thomas> alphabetical order is created in each menu.

 Thomas> Note that this sometimes mean that packages that logically
 Thomas> belong together, like cups, gutenprint, hplip, are now split
 Thomas> apart.

 Thomas> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed with some fixups now that we've added more packages, thanks.

 Thomas> For the vim users out there: do you know the 'filter' command?
 Thomas> This allows to take content from the document, pipe it through
 Thomas> a shell pipeline of your choosing, and put the output back in
 Thomas> the document in place of the original text.  For example:
 Thomas> :'<,'>! sort will replace the visual selection with its sorted
 Thomas> version.  There exist also 'read!' and 'write!' commands that
 Thomas> do more or less half of the filter command: read takes output
 Thomas> from a shell pipeline and pastes it in the document, but does
 Thomas> not use any input from the document. The write command uses
 Thomas> text from the document as input for the shell pipeline, but
 Thomas> discards the output.  See :help filter, :help read!, :help
 Thomas> write!

Yeah, emacs has it as well (M-| cmd)

-- 
Bye, Peter Korsgaard
