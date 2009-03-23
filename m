From: Daniel Mack <daniel@caiaq.de>
Date: Mon, 23 Mar 2009 15:29:04 +0100
Subject: [Buildroot] Package license constraints
In-Reply-To: <49C7858F.2080904@maxim-ic.com>
References: <49C3C0EF.8010003@maxim-ic.com>
	<200903211906.04999.markus.heidelberg@web.de>
	<d6cda7730903211717x33f412e7g3706c57232850ae3@mail.gmail.com>
	<49C7858F.2080904@maxim-ic.com>
Message-ID: <20090323142904.GB5042@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 23, 2009 at 01:50:23PM +0100, Gr?gory Rom? wrote:
>> I guess it depends on what you want to push. Qt is GPL, LGPL and
>> Commercial. It already made sense to have it before, having the
>> commercial support was just a matter of a few config changes. On the
>> other hand, we don't have any thing on buildroot that *requires* Qt
>> commercial, because it's proprietary code or something like that.
>>
>> In general, proprietary code isn't shared at all, unless it's dual
>> licensed. If you mean a binary package, them I guess the answer would
>> be pretty much "No".
>
> My goal in this case is not to share a package, but to add a 'pure'  
> binary package to the Buildroot I provide to my customer (to avoid two  
> entry points, one for the open source components and one for the others).

Don't know if my oppinion matters here, but I would say that a package
like this would at least be of some use for others (not just your
customers). Proprietary drivers would be an example, if unavoidable.

>> But hey, if you could describe your package a little more, what it is,
>> what it does, and what are the licensing terms, then we could be more
>> specific than this "maybe/probably" answer :)
>
> A cryptographic library that we sale to our customers but we don't want  
> to provide the source code (to protect the implementation).

Closed source crypto sounds insane, IMO. It's not only that there are
tons of free cryptographic implementations out there, closed source code
like this is also not very trustworthy to anybody.

Don't take it personally, but I'd certainly vote NO for that. But I'm
not the maintainer, so I can't judge.

Daniel
