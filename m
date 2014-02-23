From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 23 Feb 2014 17:08:50 +0100
Subject: [Buildroot] [PATCH] webkit: disable on powerpc
In-Reply-To: <87ppmdq1wr.fsf@dell.be.48ers.dk>
References: <b82a6eacae7968135320.1393165932@argentina>
 <87ppmdq1wr.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LWBAieLQhxtd83aoS=UcQ8AxnKJ4WqTQd_4+vJeysU38A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Sun, Feb 23, 2014 at 4:33 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
>  > webkit does not build correctly on powerpc. There is an upstream bug report
>  > with a partial fix, but with remaining problems.
>  > https://bugs.webkit.org/show_bug.cgi?id=113638
>
>  > Until this problem is fixed, we disable webkit on powerpc.
>
>  > Fixes
>  > http://autobuild.buildroot.org/results/3ce/3ce992a663ddf1030a987bb778f8275a8e5fdef0/
>
>  > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> Committed, thanks.

Thanks!

>
> What about the webkit copies in qt4/5? Do they work on powerpc?

I have no idea, I haven't seen it fail in the autobuilds yet, but I
haven't really checked either...

Best regards,
Thomas
