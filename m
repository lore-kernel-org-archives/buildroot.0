From: =?UTF-8?B?UGF3ZcWCIEdpYmFzemVr?= <gibol666@gmail.com>
Date: Thu, 23 Jan 2014 19:33:06 +0100
Subject: [Buildroot] QMultimedia problem
In-Reply-To: <201401150846.28371.fatih.asici@gmail.com>
References: <52D4C3EC.70103@gmail.com> <52D4C4C0.70503@gmail.com>
 <201401150846.28371.fatih.asici@gmail.com>
Message-ID: <52E16062.8070404@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

W dniu 2014-01-15 07:46, Fatih A??c? pisze:
>
> Would you send the config file to reproduce this problem?
>

Sorry for the delay, here is my config:
http://gibol.info/upload/.config


Original message:
>
>  I have problem with QMultimedia from Qt5 package.
>  I'm using QMediaPlayer in my application and it reports error:
> [ defaultServiceProvider::requestService(): no service found for - 
> "org.qt-project.qt.mediaplayer" ]
>
> I suspect that libgstmediaplayer.so plugin cant be loaded due to 
> missing dependency:
> [
> ldd /usr/lib/qt/plugins/mediaservice/libgstmediaplayer.so | grep found
> checking sub-depends for 'not found'
> libqgsttools_p.so.1 => not found (0x00000000)
> ]
>
> On x86 ubuntu machine this lib is present and the app is working.
>
> How can i fix this?
> I'm a newbie so forgive me if I'm missing something obvious.
> I'm using Buildroot 2014.02-git-00566-gd66c981.
>  I've also selected gsteamer1 in addition to gstreamer-0.10 and did 
> make clean but it didn't help.
>
>


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140123/e56fdf3e/attachment.html>
