From: Sadiq Hussain Muchumarri <sadiq1194@gmail.com>
Date: Mon, 2 Nov 2020 16:53:45 +0530
Subject: [Buildroot] Booting QEMU
In-Reply-To: <87k0v4qa7f.fsf@tarshish>
References: <CAB9G97pWnpMk+nDQ6=KEya5DupyyxFdt_uB7=MexNok7mR8s0A@mail.gmail.com>
 <87v9eoqdfq.fsf@tarshish>
 <CAB9G97orpxrvPbC6oKDoPVbxMCUiHF-bn8csk8+0aZ4o8iaQHQ@mail.gmail.com>
 <CAB9G97pnaTUKkNgbMje7D_hDYX-oVzeyYWkCjQSey2GuPBJ91w@mail.gmail.com>
 <87k0v4qa7f.fsf@tarshish>
Message-ID: <CAB9G97py-PFtUX7oaB=r2wLExMeAHNMqpACBYPrjxeZq4ssxMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

But, it doesn't automatically login for me.

On Mon, 2 Nov 2020, 16:47 Baruch Siach, <baruch@tkos.co.il> wrote:

> Hi Sadiq,
>
> Please keep the list on Cc.
>
> On Mon, Nov 02 2020, Sadiq Hussain Muchumarri wrote:
> > OK.
> > It boots when the command present in readme.txt is explicitly given.
> > Doesn't work if I run start-qemu.sh (not sure if this is a BUG).
> >
> > It asks for buildroot login.
> > What needs to be given?
>
> The default build creates a 'root' account with empty password.
>
> baruch
>
> > On Mon, 2 Nov 2020, 15:49 Sadiq Hussain Muchumarri, <sadiq1194@gmail.com
> >
> > wrote:
> >
> >> Yes.
> >> Apart from "-serial studio", everything else is same.
> >> According to start-qemu.sh, if I don't provide any cmd line options to
> it,
> >> then it takes "-serial studio". Otherwise, it takes "-nographic".
> >>
> >> I execute it without any arguments.
> >> Still fails though :(
> >>
> >> On Mon, 2 Nov 2020, 15:37 Baruch Siach, <baruch@tkos.co.il> wrote:
> >>
> >>> Hi Sadiq,
> >>>
> >>> On Mon, Nov 02 2020, Sadiq Hussain Muchumarri wrote:
> >>> > I've followed the below steps for a QEMU build:
> >>> >
> >>> > 1)cloned the LTS version of buildroot from GitHub
> >>> >
> >>> > 2)make clean
> >>> >
> >>> > 3)make distclean
> >>> >
> >>> > 4)make qemu_arm_vexpress_defconfig
> >>> >
> >>> > 5)make
> >>> >
> >>> > All the above steps are succesfull and I can see the artifacts in
> >>> > output/images directory.
> >>> >
> >>> > May I know how do I boot the QEMU now?
> >>>
> >>> See the command line in board/qemu/arm-vexpress/readme.txt.
> >>>
> >>> baruch
> >>>
> >>> > I see a start-qemu.sh script under output/images directory.
> >>> >
> >>> > But, that doesn't work out of the box as it says:
> >>> > "Invalid SD card size: 60MiB"
> >>> >
> >>> > Any alternative to this?
> >>> > Thanks:)
> >>>
> >>> --
> >>>                                                      ~. .~   Tk Open
> >>> Systems
> >>>
> >>>
> =}------------------------------------------------ooO--U--Ooo------------{=
> >>>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il
> -
> >>>
> >>
>
>
> --
>                                                      ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201102/35978ee2/attachment.html>
