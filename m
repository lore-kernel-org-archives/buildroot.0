From: =?UTF-8?Q?Einar_J=C3=B3n?= <tolvupostur@gmail.com>
Date: Tue, 8 Jan 2019 11:06:15 +0100
Subject: [Buildroot] [PATCH 1/1] support/scripts/check-uniq-files: Only
 report each package once
In-Reply-To: <20190102121218.GH23435@scaer>
References: <1544537144-10197-1-git-send-email-tolvupostur@gmail.com>
 <20181230220200.GB24224@scaer> <20190102121218.GH23435@scaer>
Message-ID: <CABhNV21ZyEzEbj0oUy59Phn63_i0PKiu-NTr+ZFLmL-mRNT7Rw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

my bad. Not an issue on master.

On Wed, 2 Jan 2019 at 13:12, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Einar, All,
>
> On 2018-12-30 23:02 +0100, Yann E. MORIN spake thusly:
> > On 2018-12-11 15:05 +0100, Einar Jon Gunnarsson spake thusly:
> > > Rebuilding the same package should not trigger
> > > a 'touched by more than one package' warning
>
> In fact, commit d3dca1e993 (core/pkg-generic: only save latest package
> list) should have already fixed that case, no?
>
> That commit has even been backported to the 2018.02.x branch already, as
> commit a2b029afe5.
>
> If you are using a version of Buildroot that is older than that, then
> please update. If you still have the issue after updating to a version
> that has either one of the aforementionned commits, then please report
> the issue again.

I was using 2018.02, but I tested this on the buildroot git repo
before submitting.
I must have had an older version checked out for the testing.
I've now updated to 2018.08 and this is no longer an issue.

Sorry about that.

>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
