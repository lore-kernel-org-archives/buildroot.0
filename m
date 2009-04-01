From: Lloyd Sargent <lloyd@cannasoftware.com>
Date: Wed, 1 Apr 2009 11:33:27 -0500
Subject: [Buildroot] Do I need to install twice?
Message-ID: <461F49CC-88D4-4278-947D-453AAFCFDDC5@cannasoftware.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Okay, I'm really, close to finishing the wxWidgets make and  
configuration files.

HOWEVER, I'm a little stumped. If I do the following:

	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(WXWIDGETS_DIR) install

The include directory is deleted so I am unable to build files for  
WxWidgets. But my libraries are in the right place.

To have include files I can build against I added this line:

	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(WXWIDGETS_DIR) install

It gets me the include files but I've this bad feeling that it isn't  
the right way to do it.

So have I got this right? Or have I just made a blunder?

Cheers,

Lloyd
