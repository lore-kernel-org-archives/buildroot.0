From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue, 30 Dec 2014 11:50:56 +0100
Subject: [Buildroot] [PATCH 1/1] imagemagick: bump to version 6.9.0-2
In-Reply-To: <87k319cunl.fsf@dell.be.48ers.dk>
References: <1419892549-21674-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <87k319cunl.fsf@dell.be.48ers.dk>
Message-ID: <54A28390.5030609@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

>>>>>> "Jerzy" == Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net> writes:
>   > Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
>   > ---
>   >  package/imagemagick/imagemagick.hash |    2 +-
>   >  package/imagemagick/imagemagick.mk   |    2 +-
>   >  2 files changed, 2 insertions(+), 2 deletions(-)
>
>   > diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
>   > index 20bc982..463d88b 100644
>   > --- a/package/imagemagick/imagemagick.hash
>   > +++ b/package/imagemagick/imagemagick.hash
>   > @@ -1,2 +1,2 @@
>   >  # From ftp://ftp.nluug.nl/pub/ImageMagick/digest.rdf
>   > -sha256  12331c904c691cb128865fdc97e5f8a2654576f9b032e274b74dd7617aa1b9b6  ImageMagick-6.9.0-0.tar.xz
>   > +sha256  8362d6b07ea08d2ccf0eb0c255f8369d1b1dea837daf1064e94ecc380b5ee51d  ImageMagick-6.9.0-2.tar.xz
>
> Are you sure? I get:

Ah yes, I did copy/paste the wrong hash (tar.gz instead of tar.xz one). 
Sorry for that.
Thanks.

Regards,
Jerzy

>
>>>> imagemagick 6.9.0-2 Downloading
> --2014-12-30 11:10:09--  ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-6.9.0-2.tar.xz
>             => ?/home/peko/source/buildroot/output/build/.ImageMagick-6.9.0-2.tar.xz.SbfnCI/output?
> Resolving ftp.nluug.nl (ftp.nluug.nl)... 2001:610:1:80aa:192:87:102:43, 2001:610:1:80aa:192:87:102:42, 192.87.102.43, ...
> Connecting to ftp.nluug.nl (ftp.nluug.nl)|2001:610:1:80aa:192:87:102:43|:21... connected.
> Logging in as anonymous ... Logged in!
> ==> SYST ... done.    ==> PWD ... done.
> ==> TYPE I ... done.  ==> CWD (1) /pub/ImageMagick ... done.
> ==> SIZE ImageMagick-6.9.0-2.tar.xz ... 7896448
> ==> EPSV ... done.    ==> RETR ImageMagick-6.9.0-2.tar.xz ... done.
> Length: 7896448 (7.5M) (unauthoritative)
>
> ImageMagick-6.9.0-2.tar.xz  100%[=============================================>]   7.53M  1.93MB/s   in 4.0s
>
> 2014-12-30 11:10:14 (1.88 MB/s) - ?/home/peko/source/buildroot/output/build/.ImageMagick-6.9.0-2.tar.xz.SbfnCI/output? saved [7896448]
>
> ERROR: ImageMagick-6.9.0-2.tar.xz has wrong sha256 hash:
> ERROR: expected: 8362d6b07ea08d2ccf0eb0c255f8369d1b1dea837daf1064e94ecc380b5ee51d
> ERROR: got     : ce7ced11cc1019cd37518ebc4ea03ffaff8e6891aaf41a05615689dafe854ff6
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
>
> >From the looks of it you used the hash value from the .tar.gz, not
> .tar.xz.
>
> Committed with that fixed, thanks.
>
