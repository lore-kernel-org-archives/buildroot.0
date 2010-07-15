From: Luca Ceresoli <list@lucaceresoli.net>
Date: Thu, 15 Jul 2010 14:54:39 +0200
Subject: [Buildroot] BR:Qt doesn't compile
Message-ID: <L5LNV3$BD4F538B66E3CB48DC7DF51A238DA643@aruba.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nataraj S Narayan wrote:
> Hi
> 
> #make qt
> 
> Creating qmake. Please wait...
> make[1]: Entering directory
> `/home/noy/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/qmake'
> make[1]: Leaving directory
> `/home/noy/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/qmake'
> MySQL support cannot be enabled due to functionality tests!
>  Turn on verbose messaging (-v) to ./configure to see the final report.
>  If you believe this message is in error you may use the continue
>  switch (-continue) to ./configure to continue.
> make: ***
> [/buildroot/output/build/qt-everywhere-opensource-src-4.6.2/.configured]
> Error 101

Have a look to this bug report, I suspect it's the same problem you hit.
There's a patch that could work.

https://bugs.busybox.net/show_bug.cgi?id=2221

Luca
