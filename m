From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 5 Oct 2012 00:53:45 +0200
Subject: [Buildroot] Building FFMPEG fails
Message-ID: <B8BCA720FEFB473BBD1EACE9016F23C5@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
context  latest git pull target A8 (imx53 )
 
Does this have someting to do with the selected Thread library (NTPL now)
 
...
...
CC	libavformat/vocdec.o
libavformat/udp.c:41:5: warning: "HAVE_PTHREAD_CANCEL" is not defined [-Wundef]
libavformat/udp.c:71:5: warning: "HAVE_PTHREAD_CANCEL" is not defined [-Wundef]
libavformat/udp.c:324:5: warning: "HAVE_PTHREAD_CANCEL" is not defined [-Wundef]
libavformat/udp.c: In function 'udp_open':
libavformat/udp.c:529:5: warning: "HAVE_PTHREAD_CANCEL" is not defined [-Wundef]
libavformat/udp.c:555:5: warning: "HAVE_PTHREAD_CANCEL" is not defined [-Wundef]
libavformat/udp.c: In function 'udp_read':
libavformat/udp.c:574:5: warning: "HAVE_PTHREAD_CANCEL" is not defined [-Wundef]
libavformat/udp.c: In function 'udp_close':
libavformat/udp.c:655:5: warning: "HAVE_PTHREAD_CANCEL" is not defined [-Wundef]
CC	libavformat/vocenc.o
CC	libavformat/vorbiscomment.o
CC	libavformat/vqf.o
CC	libavformat/wav.o
CC	libavformat/wc3movie.o
CC	libavformat/westwood_aud.o
CC	libavformat/westwood_vqa.o
CC	libavformat/wtv.o
CC	libavformat/wtvdec.o
CC	libavformat/wtvenc.o
CC	libavformat/wv.o
CC	libavformat/xa.o
CC	libavformat/xmv.o
CC	libavformat/xwma.o
CC	libavformat/yop.o
CC	libavformat/yuv4mpeg.o
AR	libavformat/libavformat.a
make[2]: Leaving directory `/home/buildroot12git/output/build/mplayer-1.1/ffmpeg'
make[1]: Leaving directory `/home/buildroot12git/output/build/mplayer-1.1'
make: *** [/home/buildroot12git/output/build/mplayer-1.1/.stamp_built] Error 2

 
Kind Regards;
 
Sagaert Johan
