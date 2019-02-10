From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Feb 2019 15:20:19 +0100
Subject: [Buildroot] [PATCH] add library xmlsec1
In-Reply-To: <CACHoAdp2+4-E8_KroYibuYxoFeT2groW-3-H+WS-M0aQDFvCDA@mail.gmail.com>
References: <20190209215351.29395-1-basti171@gmail.com>
 <20190210103749.50caf547@windsurf.home>
 <CACHoAdp2+4-E8_KroYibuYxoFeT2groW-3-H+WS-M0aQDFvCDA@mail.gmail.com>
Message-ID: <20190210152019.353bc305@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bastian,

On Sun, 10 Feb 2019 15:12:48 +0100
Bastian Breit <bastian.breit.buildroot@gmail.com> wrote:

> I locally fixed the formatting and licence part.

Great, thanks!

> I had some trouble with the mailing list and will use
> bastian.breit.buildroot at gmail.com from now on. 

Which trouble did you encounter ?

> We use libxmlsec1 in
> this context and haven't used another configuration. I am not sure,
> how the library works in other configuration. I would create config
> options for each option based on that list at
> https://www.aleksey.com/xmlsec/faq.html

No you don't have to support all options. If you don't support an
option (like gnutls or gcrypt), then do like you did: disable support
for it explicitly in the .mk file.

> Should I send changes for formatting & licences with a different patch
> or should I send an all in one patch?

Send all in one patch, labeled as "v2", with a changelog below the
"---" sign:

	git format-patch -v2 HEAD^

Edit the 0001-...patch file, and below the --- sign, add some notes
that explains what you changed since v1.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
