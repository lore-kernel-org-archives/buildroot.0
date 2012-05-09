From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Wed, 9 May 2012 09:28:56 -0400
Subject: [Buildroot] [PATCH v3] BeagleBone: new board
In-Reply-To: <CAGm1_kt4SWwUuVH9DkB9TWB_qY3CKQ9DY9wdMczC8dWr2D1GNA@mail.gmail.com>
References: <1336402801-15097-1-git-send-email-fhunleth@troodon-software.com>
 <CAGm1_kt4SWwUuVH9DkB9TWB_qY3CKQ9DY9wdMczC8dWr2D1GNA@mail.gmail.com>
Message-ID: <CA+-urNS=bN=RDasHrFXY6BB-w9XqtfVx3jE186Bw1k+n2dA10Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,

On Tue, May 8, 2012 at 3:22 PM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> Hi Frank,
>
> thanks for the patch. I now have a working kernel.
>
>> +BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://github.com/koenkooi/linux.git"
>
> What about using http instead of git? If I make it in the office the
> whole LAN becomes totally lame and it is also good for proxy protected
> environments.

Sigh. I actually just had a similar experience yesterday. My only
issue with http is that it feels sooo slow. Is there any way to
improve the speed? Other than that, switching all of the git urls to
http urls seems like a good idea. Maybe it's worthwhile anyway?

>
> One more issue having nothing to do with the patch itself. I cannot
> compile it with the latest Linaro toolchain. it complains about not
> having some assembly functions. With BR generated toolchain everything
> is working as expected.

I haven't tried Linaro yet. I had been trying CodeSourcery toolchains,
but gave up when none of the kernels that it produced would boot.

Frank
