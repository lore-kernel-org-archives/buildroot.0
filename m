From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Mar 2016 14:40:20 +0100
Subject: [Buildroot] tar failing to build with latest buildroot
In-Reply-To: <874mc9dygn.fsf@dell.be.48ers.dk>
References: <1457951104.2051.1.camel@rovoreed.com>
 <874mc9dygn.fsf@dell.be.48ers.dk>
Message-ID: <20160314144020.5a0ab6f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mike, Peter,

On Mon, 14 Mar 2016 13:40:40 +0100, Peter Korsgaard wrote:

>  > [mike at ceri buildroot-2016.02]$ make
>  >>>> tar 1.28 Building
>  > PATH="/home/mike/work/kodi/buildroot
>  > -2016.02/output/host/bin:/home/mike/work/kodi/buildroot
>  > -2016.02/output/host/sbin:/home/mike/work/kodi/buildroot
>  > -2016.02/output/host/usr/bin:/home/mike/work/kodi/buildroot
>  > -2016.02/output/host/usr/sbin:/usr/lib64/qt
>  > -3.3/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/home/m
>  > ike/bin:/sbin:/home/mike/.local/bin:/home/mike/bin:/home/mike/bin:/sbin
>  > "  /usr/bin/make -j5  -C /home/mike/work/kodi/buildroot
>  > -2016.02/output/build/tar-1.28/
>  > /usr/bin/make  all-recursive
>  > Making all in doc
>  > make[4]: Nothing to be done for 'all'.
> 
> Is this with a clean build? E.G. tar needs wchar, so if you didn't have
> that enabled in the toolchain configuration you will need to rebuild the
> toolchain.

Let me just add a link that further explains this:
https://buildroot.org/downloads/manual/manual.html#full-rebuild.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
