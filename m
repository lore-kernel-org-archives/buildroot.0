From: William Wagner <will_wagner@carallon.com>
Date: Tue, 02 Feb 2010 16:05:03 +0000
Subject: [Buildroot] libglib2 copies unwanted things to target
Message-ID: <4B684D2F.5090404@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Have added the libglib2 package to my target and it seems to copy over a 
load of unwanted things into the target filesystem. In particular it 
copies a load of help files to target/usr/share/gtk-doc

The package uses the autotools framework which I'm not expert on so not 
sure the best way to tackle this. Should there just be a post target 
install step to go round and delete the unwanted files? I guess better 
would be to change the glib2 install target to one that does not copy 
over the help but I'm not familiar with the package so not sure if that 
is possible.

What does anyone suggest?

Thanks
Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
