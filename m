From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 6 Oct 2009 20:40:42 +0200
Subject: [Buildroot] [PATCH 2/6] always append FPU_SUFFIX
In-Reply-To: <87iqes2wye.fsf@macbook.be.48ers.dk>
References: <cover.1254853146.git.rep.dot.nop@gmail.com>
	<1a6b4f990a536bfd23ae1e57a2cd11527761f8ec.1254853146.git.rep.dot.nop@gmail.com>
	<cover.1254853146.git.rep.dot.nop@gmail.com>
	<4a5a0f10dbaecfd7b024c0cf1e90fd68a6730eac.1254853146.git.rep.dot.nop@gmail.com>
	<87iqes2wye.fsf@macbook.be.48ers.dk>
Message-ID: <20091006184042.GA10261@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 06, 2009 at 08:34:17PM +0200, Peter Korsgaard wrote:
>>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:
>
>Why?

I can have (e.g.) m68k toolchains with and without fpu/mmu.
It's much easier to just use _nofpu_nommu suffices than to repeatedly
rebuild for a gazillion of different combinations.
>
>Please provide a bit more detailed commit messages to why we would want
>to do this - Shouldn't we rather get rid of that suffix completely?
