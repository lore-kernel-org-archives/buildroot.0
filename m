From: Will Newton <will.newton@gmail.com>
Date: Sat, 6 Nov 2010 16:24:21 +0000
Subject: [Buildroot] Results of random configuration builds
In-Reply-To: <87sjze1lfq.fsf@macbook.be.48ers.dk>
References: <20101106134454.7769d258@surf>
	<AANLkTimvA9Tr_Jd8pB1O0_ZtNu6v+tz5cBzGNhgCnME0@mail.gmail.com>
	<87sjze1lfq.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTi=33Sk5w1502yMu123Q8Z9q4A8sCmUsSS5siwKH@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 6, 2010 at 4:11 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:
>
> Hi,
>
> ?Will> I've noticed ltrace breaks quite frequently because it is built from
> ?Will> the debian archive, which doesn't guarantee that the package will
> ?Will> remain available forever. I wonder whether we should be building
> ?Will> anything from the debian archive directly and build from
> ?Will> archive.debian.net instead.
>
> The archive is normally preferred, but a missing upstream shouldn't
> matter much with the backup mirror (sources.buildroot.net). Is that
> somehow not working for you?

I just tested it and it works for me now (i386), so I'm not sure what
the problem was that I saw previously.
