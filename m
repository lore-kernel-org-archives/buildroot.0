From: William Wagner <will_wagner@carallon.com>
Date: Mon, 13 Sep 2010 14:30:31 +0100
Subject: [Buildroot] gdb and external toolchain
Message-ID: <4C8E2777.7030202@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hello,

I'm using an external toolchain and want to get gdbserver onto my 
target. I've seen the patch by Thomas that says that gdb host and 
gdbserver should be provided by the external toolchain and I have set 
crosstools-ng to build them both.

The question I have is is there any mechanism to copy the gdbserver 
executable built with crosstools into the target directory. I can't find 
anything that should be doing this. I can just copy the file over 
manually but was thinking I should add support for this to buildroot. 
Any suggestions on how to do this?

Thanks
Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
