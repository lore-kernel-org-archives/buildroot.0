From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 6 Jan 2009 16:53:53 -0200
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <877i58nv1k.fsf@macbook.be.48ers.dk>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<d6cda7730901061022v3866b298y547235a57535d009@mail.gmail.com>
	<877i58nv1k.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730901061053q68b12ed6n51fb88f6201d20bf@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Tue, Jan 6, 2009 at 4:33 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>  Thiago> AVR32 has been recently broken (again). I would much prefer
>  Thiago> that changes were reverted (termporarily or not) and have
>  Thiago> AVR32 in this "release" rather than deem it BROKEN.
>
> What changes are those exactly?

I didn't had the time to track it down to a commit yet. But it breaks
pretty early during toolchain compilation, so I guess some svn log in
toolchain should reveal the most likely candidates.
Will see if I can go back a few releases to pin point that.

>  Thiago> Maybe we could get a buildbot going. Then we can let many of the
>  Thiago> developers/uses here contribute cpu cycle to build tests.
>
> Yes, I have been pondering that as well. I have a buildbot running at
> work for the platforms we're using with good results, but it's a
> question about coming up with varying enough configs to get good test
> coverage.
>

Having just toolchain + libc + busybox and kernel build would already
go a long way compared to our current. At least for AVR32 which I
usually build for, most common breaks are in those packages. They are
also the trickiest ones. IMHO fixing a particular package is usually
easy compared to fixing the toolchain build.

Kind Regards,
   Thiago A. Correa
