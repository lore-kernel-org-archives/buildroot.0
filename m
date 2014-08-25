From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 25 Aug 2014 14:58:09 +0200
Subject: [Buildroot] HTTP access to git repository outdated
In-Reply-To: <20140825065125.31c23be5@core2quad.morethan.org>
References: <20140825105119.GA31345@dalaran.sceen.net>
 <20140825105329.GE2661@sapphire.tkos.co.il>
 <20140825111343.GA3542@dalaran.sceen.net>
 <20140825065125.31c23be5@core2quad.morethan.org>
Message-ID: <CAAXf6LV-nhpNR7EFVxX6dDYY101cG1jtK4YtM93QOkTUfJ+pMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 25, 2014 at 1:51 PM, Mike Zick <minimod@morethan.org> wrote:
> On Mon, 25 Aug 2014 13:13:43 +0200
> Richard Braun <rbraun@sceen.net> wrote:
>
>> On Mon, Aug 25, 2014 at 01:53:29PM +0300, Baruch Siach wrote:
>> > This is a known problem. Try adding or removing the trailing slash
>> > from the git repository URL.
>>
>> This makes no difference on my machine. Is there any intent to fix it
>> at least ? I personally don't mind the issue too much if it doesn't
>> last. Others might simply not have a choice.
>>
>
> If you are posting about git.buildroot.net - - -
>
> Then:
> http://git.buildroot.net/buildroot "master" is 4 days old
>
> And:
> http://git.buildroot.net/buildroot/ "master" is 30 hours old
>
> Same, same, known problem.
>
> Check your browser after you try each "view" - your browser may
> be trying to "help" you by removing the '/' regardless of what
> you actually entered.
>
> - - - -
>
> Note: http servers **should** re-direct from /directory to /directory/
> but this one does not and it is a "managed" server.
> The hosting providers have not been able to find out "why" for
> quite some time now.

Peter, can we escalate this further or request once more to investigate this?

'managed' is not really the right word if one is not able to find out
why a slash in a URL makes a difference.

Best regards,
Thomas
