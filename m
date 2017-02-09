From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 9 Feb 2017 17:35:06 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-02-08
In-Reply-To: <20170209072858.F0F7520C2B@mail.free-electrons.com>
References: <20170209072858.F0F7520C2B@mail.free-electrons.com>
Message-ID: <20170209173506.7894720f@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  9 Feb 2017 08:28:58 +0100 (CET), Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> Build statistics for 2017-02-08
> ================================
> 
[...]
>       mipsel |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/219162ba616289f799a5053c4dcc6b8574284283

  Project ERROR: Library 'libpng' is not defined.
  make[3]: *** [sub-3rdparty-freetype-make_first] Error 3

Maybe https://codereview.qt-project.org/#/c/182309/3 is missing?

>         i686 |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/1841e983b91305ab814274bdf382cd70e1c1c110
>     mips64el |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/b5f59d85c9f175c9b0f6c11b47456fbadee25daa
>        nios2 |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/9d2efb3aece56dcb5d9ddbc3ca3e0ecaeff9b8a6
>          arm |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/20307edcbcb9c44480e0b03c30eeefc3ad812aab


  g++ -c -o project.o  -pipe -std=c++11 ...
  cc1plus: error: unrecognized command line option "-std=c++11"

The host compiler needs support for c++11, any possibility to express this requirement in buildroot?

Regards,
Peter
