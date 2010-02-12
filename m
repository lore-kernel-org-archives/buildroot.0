From: Nuno Pereira <fxss@iol.pt>
Date: Fri, 12 Feb 2010 17:54:47 +0000
Subject: [Buildroot] undefined reference to copysignl
In-Reply-To: <13abadeb1002120953q24b91634j5f17c9ce93cc634a@mail.gmail.com>
References: <13abadeb1002120953q24b91634j5f17c9ce93cc634a@mail.gmail.com>
Message-ID: <13abadeb1002120954l10e05e25y36f5738a02d16d1c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

During buildroot for PPC, I had "undefined reference to  copysignl" error,
but if I uncheck BR2_GCC_SHARED_LIBGCC it compiles ok.

Can I somehow use soft float support with shared lib for ppc?

Regards,
Nuno
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100212/38bb8d5c/attachment.htm>
