From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 14:48:31 +0100
Subject: [Buildroot] [PATCH] package/nftables: do not build docs
In-Reply-To: <1419687052-24398-1-git-send-email-yann.morin.1998@free.fr>
References: <1419687052-24398-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20141227144831.1e96cb3f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 27 Dec 2014 14:30:52 +0100, Yann E. MORIN wrote:

> Note: patching the Makefile.am is the most straightforward way of doing
> it, although we may also pre-set a bunch of variables when calling
> ./configure;
>   - DBLATEX=no to disable PDF generation
>   - DOCBOOK2X_MAN=no, DOCBOOK2MAN=no and DB2X_DOCBOOK2MAN=no to disable
>     manpage generation

Well, I believe I would actually prefer to use those environment
variables rather than patching Makefile.am and having to autoreconf the
package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
