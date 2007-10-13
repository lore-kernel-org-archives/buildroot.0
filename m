From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 13 Oct 2007 13:23:29 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <0710131212520.9729@somehost>
References: <20071012210141.1DF69A5E1B@busybox.net>
	<0710131046500.9729@somehost>
	<1192269439.26495.4.camel@elrond.atmel.sweden>
	<0710131212520.9729@somehost>
Message-ID: <20071013112329.GH20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 13, 2007 at 12:19:42PM +0200, Cristian Ionescu-Idbohrn wrote:
>On Sat, 13 Oct 2007, Ulf Samuelsson wrote:
>
>> l?r 2007-10-13 klockan 10:49 +0200 skrev Cristian Ionescu-Idbohrn:
>> > On Fri, 12 Oct 2007, ulf at uclibc.org wrote:
>> >
>> > > Author: ulf
>> > > Date: 2007-10-12 14:01:41 -0700 (Fri, 12 Oct 2007)
>> > > New Revision: 20237
>> > >
>> > > Log:
>> > > Allow library copy to fail
>> >
>> > As it's not obvious to me, may I ask why?
>> > Why not making sure it doesn't fail, instead?
>>
>> That is the long term approach, but I have no control over that part.
>
>Who has the "control over that part"?
>
>> If copying fails,
>
>Why should it?
>Have you seen it failing?
>Can you reproduce that?

It can be seen with x86_64 as target; see archives for my suggestion on
how to fix this properly instead of once again papering over a bug in an
inappropriate way.

>Is there a use case you can share with us?
>
>> then libgcc.a is available,
>> and the end application can be linked with this instead
>
>I see.
>
>> It is better than aborting the build.
>
>But doesn't cure the disease :(

It's plain wrong i would have said.

>In other words, you prefer aspirine :)
