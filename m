From: Steve Johnson <sjohnson228@gmail.com>
Date: Tue, 22 Feb 2011 21:36:04 -0800
Subject: [Buildroot] Errors using buildroot-2010.11 on Fedora 14 x86_64
In-Reply-To: <87y657n22f.fsf@macbook.be.48ers.dk>
References: <AANLkTikMr6bW=CpEH5RTq+jAm+Kd8K7YCLdDtY5E23yE@mail.gmail.com>
	<87y657n22f.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTimA2FvEFsLh44FEwQO4xv-LP1uAi0Ngc9b05w5G@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I expected to see a "SUCCESS" message.

I did not enable an output image.

Another question though. In my toolchain output directory I seem to have
multiple copies of the same binaries..
In directory /usr/bin I have the gcc compiler (and other binaries) and in
directory /usr/arm-linux/bin I also have gcc? Why is that?

Thanks,

On Tue, Feb 22, 2011 at 2:20 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Steve" == Steve Johnson <sjohnson228@gmail.com> writes:
>
>  Steve> I get the following error when I try to use buildroot (this is
>  Steve> the end of the output):
>
>  Steve> echo 2010.11 > /home//projects/embeddedlinux/test1/build-tools/
>  Steve> buildroot-2010.11/output/target/etc/br-version
>  Steve> rm -f
> /home//projects/embeddedlinux/test1/build-tools/buildroot-2010.11/output/
>  Steve> build/.fakeroot*
>
> I don't see any errors. From this output it just looks as if you didn't
> enable any output images (make menuconfig -> Target filesystem options).
>
> The warnings / ignored errors above are expected (depending on what
> packages are enabled).
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110222/d68f1e67/attachment.html>
