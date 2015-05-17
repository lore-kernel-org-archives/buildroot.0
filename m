From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 May 2015 13:37:20 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150517124934.20a9c661@free-electrons.com>
References: <20150517063017.77AD4100D35@stock.ovh.net>
 <20150517124934.20a9c661@free-electrons.com>
Message-ID: <20150517113720.GB4230@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-05-17 12:49 +0200, Thomas Petazzoni spake thusly:
> >          arm |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/e0392859a1943d1db2a5ee2f7fdf93764369d979/
> 
> This is an OpenCV issue. Samuel, can you have a look?
> 
> *** Warning: Linking the shared library libgstopencv.la against the
> *** static library /usr/lib/libopencv_ts.a is not portable!
> arm-linux-gnueabihf-g++: error: /usr/lib/libopencv_ts.a: No such file
> or directory

Samuel is already working on it, and I have also had a look.

The reason is known, and will be (hopefully!) fixed when Samuel has
finished his bump of opencv. See:
    http://lists.busybox.net/pipermail/buildroot/2015-May/128402.html

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
