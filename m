From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 21 Aug 2012 20:39:26 -0400
Subject: [Buildroot] [PATCH 6/8] fontconfig: add license info
In-Reply-To: <20120821125637.6b0257bc@skate>
References: <1345407510-10058-1-git-send-email-danomimanchego123@gmail.com>
 <1345407510-10058-6-git-send-email-danomimanchego123@gmail.com>
 <20120821125637.6b0257bc@skate>
Message-ID: <CANxTyt7w48eF1TBWJzbtaz_uao988-=y6W6LhTJF+CP9FUJNCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> For special licenses, I thought that the convention was to use the
> string "foo license", and not just "foo".

Grepping, I see only three exceptions to this:

package/zxing/zxing.mk:ZXING_LICENSE = Apache
package/poco/poco.mk:POCO_LICENSE = Boost-v1.0
package/openssl/openssl.mk:OPENSSL_LICENSE = OpenSSL or SSLeay

So, I'll resubmit as "fontconfig license".

What about sqlite?  According to http://www.sqlite.org/copyright.html, it
is "public domain".  Should sqlite's license also be "sqlite license", or
"public domain"?

Danomi -


On Tue, Aug 21, 2012 at 6:56 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Le Sun, 19 Aug 2012 16:18:28 -0400,
> Danomi Manchego <danomimanchego123@gmail.com> a ?crit :
>
> > +FONTCONFIG_LICENSE = fontconfig
> > +FONTCONFIG_LICENSE_FILES = COPYING
>
> For special licenses, I thought that the convention was to use the
> string "foo license", and not just "foo". Luca?
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120821/04481382/attachment.html>
