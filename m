From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 23:44:55 +0200
Subject: [Buildroot] [PATCH 10/18] perl-io-interface: new package
In-Reply-To: <20180810161502.21598-11-chrismcc@gmail.com>
References: <20180810161502.21598-1-chrismcc@gmail.com>
 <20180810161502.21598-11-chrismcc@gmail.com>
Message-ID: <20180812234455.0c0d8234@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Aug 2018 09:14:54 -0700, Christopher McCrory wrote:
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  package/Config.in                                |  1 +
>  package/perl-io-interface/Config.in              | 10 ++++++++++
>  package/perl-io-interface/perl-io-interface.hash |  6 ++++++
>  package/perl-io-interface/perl-io-interface.mk   | 14 ++++++++++++++
>  4 files changed, 31 insertions(+)

I've applied to next, but ...

> +PERL_IO_INTERFACE_LICENSE = Artistic or GPL-1.0+

This was again wrong. The license file says:

"""
The Artistic License 2.0
"""

And I don't see where the GPL-1.0+ option is. So I've changed the
license information to:

PERL_IO_INTERFACE_LICENSE = Artistic-2.0

I already suggested to double check the result of scancpan, here is
another example why :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
