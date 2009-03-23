From: =?UTF-8?B?R3LDqWdvcnkgUm9tw6k=?= <gregory.rome@maxim-ic.com>
Date: Mon, 23 Mar 2009 13:50:23 +0100
Subject: [Buildroot] Package license constraints
In-Reply-To: <d6cda7730903211717x33f412e7g3706c57232850ae3@mail.gmail.com>
References: <49C3C0EF.8010003@maxim-ic.com>	
	<200903211906.04999.markus.heidelberg@web.de>
	<d6cda7730903211717x33f412e7g3706c57232850ae3@mail.gmail.com>
Message-ID: <49C7858F.2080904@maxim-ic.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/22/2009 01:17 AM, Thiago A. Corr?a wrote:
> Hi,
>
> On Sat, Mar 21, 2009 at 3:06 PM, Markus Heidelberg
> <markus.heidelberg@web.de>  wrote:
>> Gr?gory Rom?, 20.03.2009:
>>> Hello,
>>>
>>> Can I add a proprietary package to buildroot which could be redistributed?
>> I think generally it's OK, otherwise we shouldn't allow building the
>> commercial license version of Qt, for example.
>
> I guess it depends on what you want to push. Qt is GPL, LGPL and
> Commercial. It already made sense to have it before, having the
> commercial support was just a matter of a few config changes. On the
> other hand, we don't have any thing on buildroot that *requires* Qt
> commercial, because it's proprietary code or something like that.
>
> In general, proprietary code isn't shared at all, unless it's dual
> licensed. If you mean a binary package, them I guess the answer would
> be pretty much "No".

My goal in this case is not to share a package, but to add a 'pure' 
binary package to the Buildroot I provide to my customer (to avoid two 
entry points, one for the open source components and one for the others).

Obviously, I'm very careful to respect the open source license!

>
> Not that we are open source zealots, but rather that it would just be
> impossible to crosscompile and have other platforms use it at all. We
> also would not like to host your binary packages for you and on the
> top of that, it could most likely be something that is not generic
> enough for many users to take advantage of that package, etc.

Sure.

>
> But hey, if you could describe your package a little more, what it is,
> what it does, and what are the licensing terms, then we could be more
> specific than this "maybe/probably" answer :)

A cryptographic library that we sale to our customers but we don't want 
to provide the source code (to protect the implementation).

> Also, then you would have much greater chance to get a reply from our
> maintainer with a final answer.
>
>>> Generally, what are the license constraints?
>> No idea.
>>
>
> Same here, so far we never had that question raised AFAIK. It could be
> complicated if your licensing terms would not permit us from
> redistributing it in the first place since we keep a mirror of the
> packages to ensure things will keep working for some time after
> release. Please be more specific.
>
> Kind Regards,
>     Thiago A. Correa


Thanks,
Gr?gory
