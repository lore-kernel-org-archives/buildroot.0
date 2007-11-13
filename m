From: Felipe Uderman <felipe.uderman@gmail.com>
Date: Tue, 13 Nov 2007 15:57:46 -0300
Subject: [Buildroot] Could not find libgcj.so*
In-Reply-To: <1194963251.31529.3.camel@salome.goteborg.syntronic.se>
References: <951b8d920711130535r232360f7td6c94608b4bf54f9@mail.gmail.com>
	<1194963251.31529.3.camel@salome.goteborg.syntronic.se>
Message-ID: <951b8d920711131057o11dbf118n7c999ac3b4270a29@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Nov 13, 2007 11:14 AM, Andreas Aronsson <anar@syntronic.se> wrote:

>  First, I believe that best practice is to have the locale set to english
> which makes it easier to help.
>

Yes, that is true.


> Second, out of curiosity, what does
>
> grep BR2_INSTALL_LIBGCJ $(BULDROOTDIR).config
>

Here is the output:

BR2_INSTALL_LIBGCJ=y

I have changed it to "n" and now the compilation managed to go on.

Thank you!

Felipe Uderman
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071113/0d856854/attachment.htm 
