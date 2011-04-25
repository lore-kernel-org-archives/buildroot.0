From: Charles Krinke <charles.krinke@gmail.com>
Date: Sun, 24 Apr 2011 20:15:20 -0700
Subject: [Buildroot] JFFS2 Question
In-Reply-To: <87fwp78giq.fsf@macbook.be.48ers.dk>
References: <BANLkTi=WFMS9Uv-x6H8iHO-vDFwRvdS2hA@mail.gmail.com>
	<87fwp78giq.fsf@macbook.be.48ers.dk>
Message-ID: <BANLkTik4X6F=W6JCAcazhYx=9+GoguWawg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I believe the sector size is correct but I am suspecting that the original
Freescale engineer that created the 8323 support did not complete the nor
flash. Meaning I think it is probably locked.

You woldn't know off hand which file an unlocking subroutine should go into,
would you?
On Apr 24, 2011 2:51 PM, "Peter Korsgaard" <jacmet@uclibc.org> wrote:
>>>>>> "Charles" == Charles Krinke <charles.krinke@gmail.com> writes:
>
> Hi,
>
> Charles> I seem to have gotten myself into a pickle (again) now that I
> Charles> have worked out the details of mounting a buildroot generated
> Charles> rootfs.jffs2.
>
> Charles> It boots on my MPC8323 target. I can "ls", "cd", "cat". But,
> Charles> .... when it boots, it complains a bit
>
> Charles> Write of 68 bytes at 0x002fc498 failed. returned -30, retlen
67087004
> Charles> Erase at 0x008a0000 failed immediately: -EROFS. Is the sector
locked?
>
> Did you configure jffs2 for the correct flash size? Are your flash
> sectors locked (protected?) You can normally check in u-boot.
>
> --
> Bye, Peter Korsgaard
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110424/cf4180a6/attachment.html>
