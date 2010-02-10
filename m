From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Feb 2010 08:26:59 +0100
Subject: [Buildroot] libglib2 build failure
In-Reply-To: <1265783166.2185.17.camel@coalu.atr>
References: <20100210004822.5cc69bd2@surf> <1265783166.2185.17.camel@coalu.atr>
Message-ID: <20100210082659.63d38b8c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 10 Feb 2010 07:26:06 +0100
Lionel Landwerlin <llandwerlin@gmail.com> wrote:

> I recompiled libglib2 2.22.4 recently with an external toolchain and
> having libglib2-dev installed on my host, and I don't see the
> problem...

Ah, ah, interesting. Just for curiosity, which version of libtool is
installed on your host ? On mine, it's libtool 1.5.26.

> What if you set AUTORECONF=YES and LIBTOOL_PATCH=YES ?

Well, I think LIBTOOL_PATCH=YES cannot work, since the
buildroot-libtool.patch only applies properly to packages containing
libtool 1.x, and libglib2 contains libtool 2.x.

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
