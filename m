From: Lionel Orry <lionel.orry@gmail.com>
Date: Tue, 26 May 2015 13:30:34 +0200
Subject: [Buildroot] Auto loading out of the tree device driver using
	UDEV
In-Reply-To: <851200312.2153086.1432638360110.JavaMail.yahoo@mail.yahoo.com>
References: <851200312.2153086.1432638360110.JavaMail.yahoo@mail.yahoo.com>
Message-ID: <CAKAx1cis9nR_e62J05FGfWwNafpxWN6snyDQGsnNJwjV2qN4VQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tal,

On Tue, May 26, 2015 at 1:06 PM, Tal Lubko <tallubko@yahoo.com> wrote:
> Hi
>
> I'm trying to get an out of the tree device driver to be auto loaded when
> system starts using UDEV.
> I've managed to do so if I run depmod on target but I don't know how to do
> that on the host when building the file system.
> I'm not even sure that depmod is the correct way to do that.

maybe you could simply use 'insmod' instead of 'modprobe' to load the
module? You can give the whole path to your module file to insmod.
I'm not sure to properly answer your question though...
>
> I appreciate your help,
> Tal
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,
Lionel
