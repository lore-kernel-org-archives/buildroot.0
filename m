From: Marcelo Gutierrez <kuyurix@gmail.com>
Date: Thu, 13 Feb 2014 20:50:54 -0200
Subject: [Buildroot] [PATCH 1/1] ti-gfx: bump to version 5_01_00_01
In-Reply-To: <CAEBucnAUUP3==KSjx_uXZpcjfk9KNwOQqhQ0Eb-hu2+J7wfcKQ@mail.gmail.com>
References: <52fd38fd.870eec0a.7f7f.13a5@mx.google.com>
 <CAEBucnAUUP3==KSjx_uXZpcjfk9KNwOQqhQ0Eb-hu2+J7wfcKQ@mail.gmail.com>
Message-ID: <CA+kK6Ws34CaJSSsk1cjg1=OKUXpoURarO9d9sTS8CGO7dXqNtQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Spenser,

Please see the following site.  The 5_01_00_01 version is not a
> supported version; it is of alpha quality and has several
> deficiencies.
>
>
> http://tigraphics.blogspot.com/2013/11/4q-2013-linux-graphics-sdk-release.html
>


I've tested Graphics SDK 5_01_00_01 and run great!
This is the release note:
http://processors.wiki.ti.com/index.php/RN_5_01_00_01

The link that you've sent is about 5_00_00_01_alpha version and maybe that
version got several issues.

On the other hand, a feature in this release(5_01_00_01) is " 3.12 kernel
support"  and if you take a look this commit "beaglebone: update to TI 3.12
kernel"

http://git.buildroot.net/buildroot/commit/configs?id=1ca56e4e159cd5dd44cd3aba997396d49f22ecda

The new update to TI 3.12 will not work with the actual version
"TI_GFX_VERSION = 4_09_00_01"

Regards,
Marcelo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140213/fcc55e88/attachment.html>
