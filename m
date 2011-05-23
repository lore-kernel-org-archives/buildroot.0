From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Mon, 23 May 2011 14:42:12 +0200
Subject: [Buildroot] Some build failures to solve for volunteers
In-Reply-To: <20110523142820.14924d4c@surf>
References: <20110522171916.0ba1bba7@surf>
	<BANLkTinq4Nr71bL3+O+nfUXbYvJzu36GJw@mail.gmail.com>
	<20110523142820.14924d4c@surf>
Message-ID: <BANLkTinD8BNxzLKe8bR940aeFNxANr85vg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> > Unfortunately, some of the builds have been done with external
>> > toolchains, and the page above doesn't give details about the custom
>> > external toolchains I'm using. But anyway, if people have time to go
>> > through some of these failures and contribute fixes, that'd be
>> > really great.
>>
>> How about setting up a couple of buildbots with different toolchains
>> and all options enabled? We can all help running build slaves?
>
> I have no experience with BuildBot, but as far I as could see, BuildBot
> is oriented towards building the same software in the same
> configuration over and over again, for continuous integration. From
> what I could see, it assumes that it has a finite set of build
> configurations, and run them all.

There's no problem running Buildroot builds with Buildbot. I do
actually have one running here locally for our local needs. :)

One could set "make randpackageconfig" as one step of the build
process in the Factory, but that makes it hard to find patterns in the
failing builds, hence my suggestion of one toolchain per slave and all
options enabled. Maybe there's other advantages of random configs?
