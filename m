From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 12 May 2009 14:33:54 -0300
Subject: [Buildroot] [GIT PULL] avr32 updates
In-Reply-To: <87y6t262c4.fsf@macbook.be.48ers.dk>
References: <d6cda7730905072152p4cce227cx2919291711edaf4d@mail.gmail.com>
	<d6cda7730905080217u3ade15c6r401cb5832d5d1609@mail.gmail.com>
	<87ab5oapss.fsf@macbook.be.48ers.dk>
	<200905091050.04559.markus.heidelberg@web.de>
	<87y6t262c4.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730905121033n3c0f9078n95763ea6b6c1c26c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI,

On Tue, May 12, 2009 at 7:30 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:
> ?>> No, if none of us modify the patch then the git sha1 id will be the
> ?>> same
>
> ?Markus> No, it will be different because of the different committer identity.
>
> Yes ofcourse. I meant that the file (blob) id would be identical.
>

I actually applied the rsync patch with git commit --author="name
<email>". And the log looks just like he commited directly.
If we apply patches like that, both you and those with personal trees,
shouldn't pulls figure out and apply it properly?

Thanks,
    Thiago A. Correa
