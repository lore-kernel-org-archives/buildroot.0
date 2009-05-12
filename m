From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 12 May 2009 17:09:47 -0300
Subject: [Buildroot] [GIT PULL] avr32 updates
In-Reply-To: <874ovq5ck2.fsf@macbook.be.48ers.dk>
References: <d6cda7730905072152p4cce227cx2919291711edaf4d@mail.gmail.com>
	<d6cda7730905080217u3ade15c6r401cb5832d5d1609@mail.gmail.com>
	<87ab5oapss.fsf@macbook.be.48ers.dk>
	<200905091050.04559.markus.heidelberg@web.de>
	<87y6t262c4.fsf@macbook.be.48ers.dk>
	<d6cda7730905121033n3c0f9078n95763ea6b6c1c26c@mail.gmail.com>
	<874ovq5ck2.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730905121309w17e39b5em91540bcd54cceb61@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, May 12, 2009 at 4:46 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:
>
> Hi,
>
> ?Thiago> I actually applied the rsync patch with git commit --author="name
> ?Thiago> <email>". And the log looks just like he commited directly.
> ?Thiago> If we apply patches like that, both you and those with personal trees,
> ?Thiago> shouldn't pulls figure out and apply it properly?
>
> The author will be the same, but the committer will still be
> different. Taking about that rsync patch, will you send a pull request
> soonish or should I apply it myself? I would like to include it and
> release a -rc2 soon.

Yeah, I was trying to squeeze a cups fix too before adding
atngw100-extended_defconfig update and requesting a pull.
But it appears the cups problem is beyond my skills, so I guess I will
just disable it from the defconfig for now and add a bug report.

Do you have a cut date for pull requests?
