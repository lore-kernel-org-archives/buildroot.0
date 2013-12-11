From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Dec 2013 21:16:28 +0100
Subject: [Buildroot] [PATCH 00/38] Python infrastructure and package
 conversion
In-Reply-To: <CAAXf6LWJroTt-Xu=AzKVidVZbyKUjVk-+a=+cGqCO890YQ4pvw@mail.gmail.com>
References: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAAXf6LWJroTt-Xu=AzKVidVZbyKUjVk-+a=+cGqCO890YQ4pvw@mail.gmail.com>
Message-ID: <20131211211628.56c701fa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Mon, 9 Dec 2013 17:44:58 +0100, Thomas De Schampheleire wrote:

> I must say I'm very happy with this Python infrastructure for
> buildroot. It removes quite some code and creates better consistency.
> It's also great that you incorporated the pending Python patches from patchwork!
> I did a basic review of your patches and provided some minor comments,
> but nothing big.

Thanks for review, very useful, as usual!

> What kind of testing did you already do? Did you compile-test all
> touched packages?

I did compile test all of them, yes. For all the existing packages, I
also did a comparison between a build before the patch series, and
after the patch series. The list of installed files are similar, except
for python-thrift and python-protobuf (see
http://code.bulix.org/panul0-85169?raw), but these differences are not
important apparently, which Gustavo confirmed on IRC. Also, I verified
that all the native libraries (.so files) are properly built for ARM,
to at least verify that some native compilation hasn't sneaked into the
build.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
