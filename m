From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Tue, 28 Aug 2018 08:17:33 -0600
Subject: [Buildroot] SDL2+directfb combo does not work as built by
 buildroot-2018.02.3
In-Reply-To: <878t4q7vqu.fsf@dell.be.48ers.dk>
References: <CAGrGpJDVHStp8MUZaGb1=ZfWud-k4fQP=piwsc-QfftCDFyKog@mail.gmail.com>
 <CAGrGpJA=Kk0fGjMPfH3R1ZbyJbonPNPQoyC_tpjaF9Ua92BNNg@mail.gmail.com>
 <878t4q7vqu.fsf@dell.be.48ers.dk>
Message-ID: <CAGrGpJCe67xHWAceYw6-oD=iPoL0be8-ZhRgmWfhQRuG0GwxeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter

My original plan was to wait for the next SDL2 release thereby allowing
SDL2 to fix itself before updating the SDL2_VERSION in  buildroot.

Otherwise we have to change buildroot SDL2_VERSION to  point to the
temporary patched SDL2 source for download:
http://www.libsdl.org/tmp/SDL-2.0.zip
OR
somehow change buildroot to download this patch and apply it to the
downloaded SDL2-2.0.8 before compiling (I am not sure how to do this in
buildroot).

Then we would need to re-change this all back when the new release of SDL2
incorporates this patch.

..... unless I am missing something.....

Peter

On Tue, Aug 28, 2018 at 2:15 AM, Peter Korsgaard <peter@korsgaard.com>
wrote:

> >>>>> "Peter" == Peter Thompson <peter.macleod.thompson@gmail.com> writes:
>
>  > RESOLVED
>  > SDL2-2.0.8 works on Beaglebone Black using DirectFB provided the
> following
>  > patch is applied to SDL2-2.0.8.
>
>  > https://hg.libsdl.org/SDL/raw-rev/751cdc74d55c
>
>  > The patch was created by Sam Lantinga and will be incorporated into the
>  > next release of SDL2.
>
> Great, care to send a proper patch with your signed-off-by for this?
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180828/017cb20e/attachment.html>
