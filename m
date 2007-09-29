From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 29 Sep 2007 18:26:59 +0200
Subject: [Buildroot] undefined reference to `bcopy' - what's changed?
In-Reply-To: <46FE7D34.6090703@promwad.com>
References: <46FE7D34.6090703@promwad.com>
Message-ID: <20070929162659.GP20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 29, 2007 at 07:28:36PM +0300, Ivan Kuten wrote:
>Hi,
>
>I started getting this error. The same config for ARM920T, just doing svn ups and rebuilding buildroot.
>Day ago it wasn't there.

You're trying to use a SUSv3 LEGACY function. I'd fix the package, but
if you're not converned about bloating your build with LEGACY stuff then
you can of course turn on support for legacy in uClibc.
