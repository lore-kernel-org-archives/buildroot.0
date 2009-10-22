From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 22 Oct 2009 21:41:32 +0200
Subject: [Buildroot] [RFC; PATCH] Use gdbserver from external toolchain
In-Reply-To: <2c9a759f0910220247u18c004epcb564aa65aa02d2b@mail.gmail.com>
References: <2c9a759f0910220247u18c004epcb564aa65aa02d2b@mail.gmail.com>
Message-ID: <1256240492.25025.33.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le jeudi 22 octobre 2009 ? 11:47 +0200, Anders Darander a ?crit :
> Hi,
> 
> I've attached a patch (formatted by git), which adds the possibility
> to have buildroot install the already compiled gdbserver from an
> external toolchain.
> 
> To  make sure that debuging works, it is preferred if both the host
> crosscompiler gdb and gdbserver is built from the same gdb version. If
> we take the gdbserver from the external toolchain, this is guaranteed.
> 
> I'm not sure that the implementation is the best, it migth be  a
> little bit "hackish". Looking forward to some comments for
> improvement.
> 
> Regards,
> Anders

Hi Anders,

Interesting patch ;)

Maybe you could add

	depends on BR2_TOOLCHAIN_EXTERNAL

to your BR2_TOOLCHAIN_EXTERNAL_GDBSERVER option.

Regards,

-- 
Lionel Landwerlin <llandwerlin@gmail.com>
