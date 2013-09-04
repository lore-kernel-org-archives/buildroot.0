From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 4 Sep 2013 14:16:02 +0200
Subject: [Buildroot] [PATCH] dependencies: Add host prerequisite for
	elf2flt
In-Reply-To: <5227241B.7030508@zacarias.com.ar>
References: <1378282615.12336.1.camel@phoenix> <20130904105101.1662e059@skate>
 <52270CBA.1000603@zacarias.com.ar> <20130904131900.7225d262@skate>
 <52271915.6050702@zacarias.com.ar> <20130904133445.0af91136@skate>
 <CAAXf6LW+C8GpD8vh4D3xQKNHggYOXmbG8xSRBttuYt8+usCnoA@mail.gmail.com>
 <5227241B.7030508@zacarias.com.ar>
Message-ID: <CAAXf6LXmw7TF_9UmfxTLunR+x-mQB2uM9R-UAJg8Er+bZAizfw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Op 4-sep.-2013 14:14 schreef "Gustavo Zacarias" <gustavo@zacarias.com.ar>
het volgende:
>
> On 09/04/2013 09:13 AM, Thomas De Schampheleire wrote:
>
> > I know little about this flat format, but isn't it possible to use an
> > external toolchain and still want flat binaries?
>
> Yes, an example is the blackfin external toolchain.
> elf2flt is shipped with said toolchains so it's not related if that's
> your concern.

Ok thanks. That was indeed my concern...

Best regards,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130904/9f831d7a/attachment.html>
