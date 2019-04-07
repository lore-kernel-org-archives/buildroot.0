From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 7 Apr 2019 14:09:18 -0700
Subject: [Buildroot] [PATCH 1/1] boost: correctly disable icu in locale
 if needed
In-Reply-To: <CAMo8Bf+3Q310wGTJWWeSGP8G2-71m0yEVhWZ6wQJfe6CpfC8gQ@mail.gmail.com>
References: <20180713174247.4005-1-fontaine.fabrice@gmail.com>
 <20190407222519.01e928a6@windsurf>
 <CAMo8Bf+3Q310wGTJWWeSGP8G2-71m0yEVhWZ6wQJfe6CpfC8gQ@mail.gmail.com>
Message-ID: <CAMo8Bf+a5JZcfG4JGibU6icFbMN0SdDiTfRidD9wRYk2dxf2gg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Apr 7, 2019 at 1:45 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
> On Sun, Apr 7, 2019 at 1:25 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> > the last Boost build errors I
> > can see at http://autobuild.buildroot.net/?reason=boost% are:
> >
> >  - Download failure due to DNS resolution problem (late March)
> >
> >  - Internal compiler error on Xtensa, mips64, ARC (dating back from
> >    January/February)
>
> I didn't see that. Will take a look at the ICE on xtensa.

Hmmm... Does not reproduce here, the build is successful. Puzzled.

-- 
Thanks.
-- Max
