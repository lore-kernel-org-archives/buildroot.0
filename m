From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 01 Mar 2010 22:47:25 +0200
Subject: [Buildroot] X11R7.5 git branch
In-Reply-To: <4B8BD799.3040008@carallon.com>
References: <4B8AB776.40204@gmail.com> <4B8BD799.3040008@carallon.com>
Message-ID: <4B8C27DD.5000006@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/01/2010 05:04 PM, William Wagner wrote:
> On 28/02/2010 18:35, Paulius Zaleckas wrote:
>> Hi,
>>
>> As we have discussed earlier I have put all my X11R7.5 work in:
>>
>> git://gitorious.org/takeme-buildroot/takeme-buildroot.git x11r75
>>
>> Should I post patch series to the list?
>> I am waiting for your comments on my work!
>
> Paulius, have started look at what you have done. Good work,
> depressingly similar to all the work I have done, but oh well.

Fonts are the most boring part ;)

> One thing I have noticed is that you have quite a few changes in there
> that are not related to x11, any chance of splitting those out as
> separate patches as don't want them to complicate review.

Which changes are not related?
I have pushed two branches there. Master contains all my patches, while
x11r75 branch has only X11 related changes. However there is some changes like
XCB, but its newer version is required by X11R7.5.
The other problem with my change series is that it will break git bisect...

> Peter - what do you suggest should be the process for getting this in,
> most of it looks good but there are a few places where I think things
> can be improved. Should Paulius and I try to get a master repository
> that we both sign off on?

Double sign off sounds good. Don't hesitate and lets discuss all places
we can improve!

> Will
>
