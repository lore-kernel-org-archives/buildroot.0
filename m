From: Will Newton <will.newton@gmail.com>
Date: Thu, 2 Feb 2012 12:15:02 +0000
Subject: [Buildroot] [PATCH] pixman: Bump version to 0.24.2
In-Reply-To: <87d39xbfo0.fsf@macbook.be.48ers.dk>
References: <CAFbHwiTE-oKMz5iyy284Kz++1VwWhei-T=iAhUVx3o2_GJs-jA@mail.gmail.com>
 <87d39xbfo0.fsf@macbook.be.48ers.dk>
Message-ID: <CAFbHwiSZURBTrTdhGsqEu+ZNoJ+u7yCGvH4947zG1Faec3Awxg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 2, 2012 at 12:09 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:
>
>  Will> The patch to disable tests is no longer required as configure
>  Will> checks to see if the GTK+ tests should be built.
>
> That's not really true. As far as I can see, the tests are always built
> (with png support if available), and the gtk test is used to decide if
> the gtk-based demos are built.

Ah ok, I was unsure why the patch was there to begin with and assumed
it was the GTK+ dependency it was avoiding. I didn't see any problems
in my build testing without it.

> The checks use pkg-config, so we need to depend on that.

Well spotted, thanks!
