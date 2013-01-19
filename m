From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 19 Jan 2013 15:29:10 +0100
Subject: [Buildroot] [PATCH 1/1] Qt : bump version to latest 4.8.4
In-Reply-To: <50FA9A9A.1080806@relinux.de>
References: <1358081260-14635-1-git-send-email-sagaert.johan@skynet.be>
 <871udozzd5.fsf@dell.be.48ers.dk> <50FA67AD.3070506@relinux.de>
 <87622th35m.fsf@dell.be.48ers.dk> <50FA9A9A.1080806@relinux.de>
Message-ID: <750E8FD99B5A4A54AF04A6CA3B318BE8@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

That?s  strange, I did a rebuild with all gstreamer stuff disabled and everything enabled in QT and the build completed.

Snip .........

       You may choose to re-run configure with the -no-exceptions
        option to compile Qt without exceptions. This is completely binary
        compatible, and existing applications will continue to work.


Building on:   qws/linux-x86-g++
Building for:  qws/linux-arm-g++
Architecture:  arm
Host architecture: i386

Build .................. libs examples demos docs translations
Configuration ..........  silent cross_compile release shared dll embedded largefile stl precompile_header  minimal-config
small-config medium-config large-config full-config embedded reduce_exports ipv6 clock-gettime clock-monotonic mremap getaddrinfo
ipv6ifname getifaddrs inotify png no-tiff freetype zlib glib dbus openssl alsa concurrent xmlpatterns multimedia audio-backend svg
script scripttools declarative release
Debug .................. no
Qt 3 compatibility ..... no
QtDBus module .......... yes (run-time)
QtConcurrent code ...... yes
QtGui module ........... yes
QtScript module ........ yes
QtScriptTools module ... yes
QtXmlPatterns module ... yes
Phonon module .......... no
Multimedia module ...... yes
SVG module ............. yes
WebKit module .......... yes
JavaScriptCore JIT ..... yes
Declarative module ..... yes
Declarative debugging ...yes
Support for S60 ........ no
Symbian DEF files ...... no
STL support ............ yes
PCH support ............ yes
MMX/3DNOW/SSE/SSE2/SSE3. no/no/no/no/no
SSSE3/SSE4.1/SSE4.2..... no/no/no
AVX..................... no
iWMMXt support ......... no
NEON support ........... no
IPv6 support ........... yes
IPv6 ifname support .... yes
getaddrinfo support .... yes
getifaddrs support ..... yes
Accessibility .......... no
NIS support ............ no
CUPS support ........... no
Iconv support .......... no
Glib support ........... yes
GStreamer support ...... no
PulseAudio support ..... no
Large File support ..... yes
GIF support ............ plugin
TIFF support ........... no
JPEG support ........... plugin (qt)
PNG support ............ yes (qt)
MNG support ............ plugin (qt)
zlib support ........... yes
Session management ..... no
Embedded support ....... arm
Freetype2 support ...... yes
Graphics (qt) .......... linuxfb linuxfb qvfb directfb
Graphics (plugin) ...... 
Decorations (qt) ....... styled windows default
Decorations (plugin) ... 
Keyboard driver (qt) ... tty tty linuxinput qvfb
Keyboard driver (plugin) .. 
Mouse driver (qt) ...... linuxtp linuxtp linuxinput tslib
Mouse driver (plugin) .. 
OpenGL support ......... no
OpenVG support ......... no
OpenSSL support ........ yes (run-time)
Alsa support ........... yes
ICD support ............ no
libICU support ......... no
Use system proxies ..... no

Snip...

I think there might be some tweaking to have some extra menu items, like selecting Phonon.

Regards Johan




-----Oorspronkelijk bericht-----
Van: Stephan Hoffmann [mailto:sho at relinux.de] 
Verzonden: zaterdag 19 januari 2013 14:08
Aan: Peter Korsgaard
CC: Sagaert Johan; buildroot at busybox.net
Onderwerp: Re: [PATCH 1/1] Qt : bump version to latest 4.8.4

Am 19.01.2013 11:34, schrieb Peter Korsgaard:
>>>>>> "Stephan" == Stephan Hoffmann <sho@relinux.de> writes:
>  Stephan> Am 13.01.2013 19:55, schrieb Peter Korsgaard:
>  >>>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:
>  Sagaert> Qt : bump verson to latest release of QT 4  Sagaert> 
> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>  >>  >> 
> Committed, thanks (with a tweaked commit message)  >>  Stephan> Hello,
>
>  Stephan> this one seems to break autobuild on arm:
>
> Yes, the webkit part seems to have grown a gstreamer dependency. I'll 
> take a look at it, but this weekend is my Sons birthday
Happy birthdat to him!
>  - So it probably
> won't be before next week.
No hurry, I just wanted to let you know what I fonud out this morning while looking at the build results.

Stephan

-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
