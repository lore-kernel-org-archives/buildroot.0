From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 6 Oct 2009 20:44:42 +0200
Subject: [Buildroot] [PATCH 4/6] improve arch selection and gcc setup
In-Reply-To: <8763as2wuy.fsf@macbook.be.48ers.dk>
References: <cover.1254853146.git.rep.dot.nop@gmail.com>
	<1a6b4f990a536bfd23ae1e57a2cd11527761f8ec.1254853146.git.rep.dot.nop@gmail.com>
	<4a5a0f10dbaecfd7b024c0cf1e90fd68a6730eac.1254853146.git.rep.dot.nop@gmail.com>
	<6fe0ac8fa1f42152f604ca708aff08b8f119073a.1254853146.git.rep.dot.nop@gmail.com>
	<cover.1254853146.git.rep.dot.nop@gmail.com>
	<582a63d745311a980a8700a2a0ec17c3ae0f5ca9.1254853146.git.rep.dot.nop@gmail.com>
	<8763as2wuy.fsf@macbook.be.48ers.dk>
Message-ID: <20091006184442.GC10261@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 06, 2009 at 08:36:21PM +0200, Peter Korsgaard wrote:
>>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:
>
>Again, please provide more detailed commit messages. This seems to be
>several unrelated changes?

It adds some arches, fleshes out the cpu selection and provides for a
gcc that defaults to generate code for the selected cpu. Any "unrelated"
change is making sure that the changes are propagated properly. Ok?
