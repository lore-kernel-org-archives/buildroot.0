From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 11 May 2015 15:09:55 -0400
Subject: [Buildroot] Reminder about your pending Buildroot patches
In-Reply-To: <20150421125643.A04F688A@mail.free-electrons.com>
References: <20150421125643.A04F688A@mail.free-electrons.com>
Message-ID: <CANxTyt7kUnJcjkyhVfNrDaFJA=tQSPMoFwakEBoCrysJn6BJoQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Apr 21, 2015 at 8:56 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> This is a reminder about your Buildroot patches that are older than 30
> days.
>
> We need your help to know if your patches are still relevant or not.
> To help us, make sure to update the status of your patches in
> patchwork as appropriate, or to resend an updated version that applies
> on the latest Buildroot master. Especially let us know if you would
> like to withdraw your patch if you are no longer interested.
>
> Here is the list of patches you have submitted that are still pending:
>
>  - [1/3] ccache: change compilercheck to use compiler and toolchain info
>    http://patchwork.ozlabs.org/patch/287383/

I'm content to maintain my own limited solution (external toolchain,
no shared cache dirs) as a private buildroot mod, as it meets my
needs.  By all means, reject away.


>  - [2/2] ntp: prevent keyword-gen failure during ntp_keyword.h check
>    http://patchwork.ozlabs.org/patch/371305/

I am still able to reproduce this on my buildroot-2014.05 system with
NTP updated to the latest version and patches - but I cannot reproduce
this issue using HEAD with the save defconfig.  I don't understand it,
but its hard to argue with success.  Lets withdraw this one as well.


>  - [v2] qt: add gst-plugins-base dependency to multimedia module
>    http://patchwork.ozlabs.org/patch/389171/

I've no personal investment with this one.  You asked me to look into
an autobuilder failure, and this was the resulting fix.  The defconfig
from that original failure *still* causes a Qt build failure, and the
patch still applies (with a shift), and still fixes the build failure.
So I think this patch is still applicable, and okay as-is.

Danomi -


> We have a lot of pending patches:
>    https://patchwork.ozlabs.org/project/buildroot/list/
>
> You can help shorten this list by reviewing and testing patches, which
> helps the maintainers when applying patches. The more patches are
> reviewed or tested patches, the more are applied; the more are
> applied, the shorter the list; the shorter the list, the faster
> patches are applied.
>
> Thanks a lot for your help and contribution to Buildroot!
> --
> Buildroot, http://buildroot.org
