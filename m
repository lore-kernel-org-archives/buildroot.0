From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 20 Jan 2014 20:05:50 +0100
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg2: new package
References: <cover.1390242867.git.yann.morin.1998@free.fr>
 <d4f3847e403c1e5c4e8733f75bbfccce6e0b4975.1390242867.git.yann.morin.1998@free.fr>
Message-ID: <el80raxhff.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
news:d4f3847e403c1e5c4e8733f75bbfccce6e0b4975.1390242867.git.yann.morin.199
8 at free.fr: 

> We package ffmpeg2 as a separate package from ffmpeg, instead of
> bumping the latter, since gstreamer-0.10's gst-ffmpeg still use an
> older version of ffmpeg.

Hi,

this is not true anymore:

gst-ffmpeg: Use internal libav instead of external ffmpeg: 
http://git.buildroot.net/buildroot/commit/?id=
6ea49a23df3fa950e253bf704188e87a583a8ba4

ffmpeg: Bump version to 1.2.5: http://git.buildroot.net/buildroot/commit/?id=
4b959fcb67675b9e0594dc6b12742e119c82c96e

Regards, Bernd
