From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 11 Sep 2018 16:02:05 -0700
Subject: [Buildroot] [PATCH v3 1/1] python-kivy: new package
In-Reply-To: <CY1PR01MB1978AE3A13CB393DE4DE9E64CC040@CY1PR01MB1978.prod.exchangelabs.com>
References: <CY1PR01MB1978AE3A13CB393DE4DE9E64CC040@CY1PR01MB1978.prod.exchangelabs.com>
Message-ID: <CAMWSM7g4mP44KprdW05Dxj70VRVL4aSG-P9BG0f2FNLG9ECn2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Enoch,

On Tue, Sep 11, 2018 at 3:36 PM Enoch W. <ixew@hotmail.com> wrote:
>
> Status update request
> =====================
>
> Hi,
>
> This package has not reached the buildroot master branch as yet. Is it
> available on some other github? Is the mailing list patch the final word?

The patch is available on the mailing list, and on patchwork [1]. The
most recent version of the patch as of now is v5, and it's awaiting
review.

> I'd like to help. I have experience with this excellent library on other
> platforms... [and porting to buildroot should not be more difficult than
> porting to Android :-)]

Awesome, it would be helpful if you could apply and test the patch,
and report back with your findings. If everything works as expected,
you can reply with your 'Tested-by:' according to section 21.3 of
Buildroot's manual [2]. This could help it get merged quicker.

> I hope it can work with directFB or sdl2 only as I have issues with
> openGL ES2 support on my platform (Beaglebone Black with the
> 4.14.67-ti-rt-r74 kernel).

I can't comment on this particular use case, because I haven't tried
it. I do know that Kivy relies heavily on GL/ES, and you're probably
not going to get far without a working implementation.

Maybe one of Mesa's software renderers would suffice?

>
> Thanks, Enoch.
>

Thanks!
Joseph

[1] http://patchwork.ozlabs.org/patch/965621/
[2] http://nightly.buildroot.org
