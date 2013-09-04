From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 04 Sep 2013 09:14:19 -0300
Subject: [Buildroot] [PATCH] dependencies: Add host prerequisite for
	elf2flt
In-Reply-To: <CAAXf6LW+C8GpD8vh4D3xQKNHggYOXmbG8xSRBttuYt8+usCnoA@mail.gmail.com>
References: <1378282615.12336.1.camel@phoenix> <20130904105101.1662e059@skate>
 <52270CBA.1000603@zacarias.com.ar> <20130904131900.7225d262@skate>
 <52271915.6050702@zacarias.com.ar> <20130904133445.0af91136@skate>
 <CAAXf6LW+C8GpD8vh4D3xQKNHggYOXmbG8xSRBttuYt8+usCnoA@mail.gmail.com>
Message-ID: <5227241B.7030508@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/04/2013 09:13 AM, Thomas De Schampheleire wrote:

> I know little about this flat format, but isn't it possible to use an
> external toolchain and still want flat binaries?

Yes, an example is the blackfin external toolchain.
elf2flt is shipped with said toolchains so it's not related if that's
your concern.
Regards.
