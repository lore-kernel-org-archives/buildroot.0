From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 5 Sep 2016 21:03:41 +1200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-09-03
In-Reply-To: <CAFOYHZCPS2=qzM=FK-h2w47h+5NLOMiVGkH+p0RnZ+CD0xkjhQ@mail.gmail.com>
References: <20160904063032.EA196101D11@stock.ovh.net>
 <CAFOYHZCPS2=qzM=FK-h2w47h+5NLOMiVGkH+p0RnZ+CD0xkjhQ@mail.gmail.com>
Message-ID: <CAFOYHZAqVeofAGhZc0JrFsBu8SB4zuNHeNjm27VVpKPJbhbH0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 5, 2016 at 8:53 PM, Chris Packham <judge.packham@gmail.com> wrote:
> Hi,
>
> On Sun, Sep 4, 2016 at 6:30 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>>          arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/73b94c6331010598669e3114e2d4f01764f4325c
>
> I had a quick look at this. The problem seems to be whatever is
> invoking pkg-config is not passing --static. I'm not familiar with
> cmake but I assume somewhere at the bottom of find_package is an
> invocation of pkg-config.

On the other hand it appears CMake will create both POPT_LIBS and
POPT_STATIC_LIBS so it's not that.
