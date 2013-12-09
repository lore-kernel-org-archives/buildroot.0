From: Javier Alejandro Saenz Leguizamon <jasaenzl@unal.edu.co>
Date: Mon, 9 Dec 2013 13:45:42 -0500
Subject: [Buildroot] wpa_supplicant doesn't compile
In-Reply-To: <87zjoa71f3.fsf@dell.be.48ers.dk>
References: <CALADVSNmgocixipUwij+HS-bari8Toi-q_micsA44YwwRr9mUQ@mail.gmail.com>
 <87ppp68mie.fsf@dell.be.48ers.dk>
 <CALADVSOXZK_dqB_UGSWKVM8D=E4S8+KkG2Pu6h5EH3d93OOyug@mail.gmail.com>
 <87zjoa71f3.fsf@dell.be.48ers.dk>
Message-ID: <CALADVSONMz_dXuAn-W8UpOu68R-cfgd=ztsi4swLX_6OYijcwQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Good Day.

Thanks a lot for your advice now wpa_supplicant is working.

Javier Alejandro S?enz Leguizam?n
Ingeniero Electr?nico
Universidad Nacional de Colombia


2013/12/9 Peter Korsgaard <jacmet@uclibc.org>

> >>>>> "Javier" == Javier Alejandro Saenz Leguizamon <jasaenzl@unal.edu.co>
> writes:
>
>  > Hi, and thx for the quick answer, its probably the toolchain, im
>  > using codesourcery 2008q3, I'm going to try again with codesoucery
>  > 2013.11 i also have another problem with openvpn and LZO compression
>  > but I'm going to fix this
>
> Yes, a toolchain from 2008 can hardly contain uptodate Linux kernel
> headers (2.6.29 is from 2009).
>
> In general, you are likely to end up with problems if you try to combine
> components of significant different age.
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131209/e68ae5d2/attachment.html>
