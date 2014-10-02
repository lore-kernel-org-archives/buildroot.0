From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 02 Oct 2014 10:54:33 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-09-30
In-Reply-To: <20141001182322.53f6fd68@free-electrons.com>
References: <20141001063012.7DD7A100CC7@stock.ovh.net>
 <20141001075116.7913ff52@core2quad.morethan.org>
 <20141001182322.53f6fd68@free-electrons.com>
Message-ID: <542D12C9.80202@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Thomas Petazzoni wrote:
> Hello,
>
> On Wed, 1 Oct 2014 07:51:16 -0500, Mike Zick wrote:
...
>> Now the noise:
>>
>> I have noticed that recently some of the fix contributors
>> have been including a "few line" quote of a typical error
>> message in addition to the "fix(es): url" comment.
>>
>> As a read-mostly member, I find that new (habit? practice?)
>> very helpful when reading the daily M.L. fix messages.
>>
>> Q:
>> Should there be a discussion on making this additional
>> information a BR "recommended practice" ?
>
> I personally don't have a strong opinion. Since the autobuilder URLs
> are stable, and supposed to be kept around forever, I don't mind seeing
> only the autobuilder URL. But if the submitter decides to include a
> portion of the error message, then fine as well. We could imagine that
> doing this would give a better change of people googling for the error
> message, to stumble across the relevant Buildroot patch rather than
> just the autobuilder results.
>
> Not sure I want to make this a mandatory thing, though. We already have
> a lot of requirements, and doing autobuilder fixes is already not that
> fun, so if we raise the barrier too much, this might discourage
> contributors.

I appreciate when people do that. It makes the commit more
self-explanatory, and it's very handy to search with git log, among
other things.

But I agree it should not be mandatory.

-- 
Luca
