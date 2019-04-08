From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 8 Apr 2019 08:53:19 -0700
Subject: [Buildroot] [PATCH 1/1] boost: correctly disable icu in locale
 if needed
In-Reply-To: <20190408092112.043f6885@windsurf>
References: <20180713174247.4005-1-fontaine.fabrice@gmail.com>
 <20190407222519.01e928a6@windsurf>
 <CAMo8Bf+3Q310wGTJWWeSGP8G2-71m0yEVhWZ6wQJfe6CpfC8gQ@mail.gmail.com>
 <CAMo8Bf+a5JZcfG4JGibU6icFbMN0SdDiTfRidD9wRYk2dxf2gg@mail.gmail.com>
 <20190408092112.043f6885@windsurf>
Message-ID: <CAMo8BfK88iQLffP51khZ=hz+qyn7rxDYZ+q=yg0c2GUzdreyxg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 8, 2019 at 12:21 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> On Sun, 7 Apr 2019 14:09:18 -0700
> Max Filippov <jcmvbkbc@gmail.com> wrote:
>
> > > I didn't see that. Will take a look at the ICE on xtensa.
> >
> > Hmmm... Does not reproduce here, the build is successful. Puzzled.
>
> Of all the failures in:
>
>   http://autobuild.buildroot.net/?reason=boost%&arch=xtensa
>
> the internal compiler error happened only once. Did you try rebuilding
> with that exact configuration and Git commit ?

Yes, I tried exact configuration and exact git commit.

> If you indeed reproduced with the same config and Git commit, then it
> can be:
>
>  1. Influence from the environment (i.e the build machine is different)
>  2. The build machine is flaky and causes random failures
>
> If needed, we can always ask Richard Braun to try to reproduce the same
> build on his machine, in order to discriminate between (1) and (2).

Yeah, I've also noticed that other ICEs were reported by the same
build machine.

-- 
Thanks.
-- Max
