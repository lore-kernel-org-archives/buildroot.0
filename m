From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 22 Jul 2009 09:46:20 +0200
Subject: [Buildroot] [git commit] Fix memstat's install
In-Reply-To: <87ocrdcl3r.fsf@macbook.be.48ers.dk>
References: <20090721104808.7013677806@busybox.osuosl.org>
	<874ot5er9g.fsf@macbook.be.48ers.dk>
	<20090721220332.GJ14135@mx.loc>
	<87ocrdcl3r.fsf@macbook.be.48ers.dk>
Message-ID: <20090722074620.GB14281@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 22, 2009 at 08:01:12AM +0200, Peter Korsgaard wrote:
>>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

>Yes, I know the -fwhole-program option, but why is this just not
>included in TARGET_CFLAGS?

because you have to add special handling for them anyway (see e.g. microcom).
It is likely that LTO will make most if not all of this unnecessary anyway.
