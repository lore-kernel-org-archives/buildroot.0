From: Marco Pastorelli <mpastorelli@gmail.com>
Date: Fri, 30 Jan 2015 16:37:27 +0100
Subject: [Buildroot] Command line tool to manage MBR partition
In-Reply-To: <20150129194850.GK19448@tarshish>
References: <CAFRxoJncaGDrer4Aa-pbFY1_zsGCLpgxdGcJqvF_3sC9noFpSg@mail.gmail.com>
 <20150129194850.GK19448@tarshish>
Message-ID: <CAFRxoJm=XPKRG=yuBQ+zpQfXdARpjTXb9dOffXSbj-aCX2Nw-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Baruch!

I have to set the flag "install utilities" to install fdisk and sfdisk into
the rootfs image.

Best regards,
Marco.

2015-01-29 20:48 GMT+01:00 Baruch Siach <baruch@tkos.co.il>:

> Hi Marco,
>
> On Thu, Jan 29, 2015 at 03:13:58PM +0100, Marco Pastorelli wrote:
> > I can't find sfdisk on buildroot-2014.08, has it been removed?
> > Is there any other command line tool to manage MBR partition?
>
> sfdisk and fdisk are provided by the util-linux package. Make sure to
> enable
> the "install utilities" option if you need these utilities.
>
> Hope this helps,
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150130/e69fde8f/attachment.html>
