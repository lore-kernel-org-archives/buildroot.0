From: Sushi Sensei <sinestado@gmail.com>
Date: Wed, 19 Sep 2007 16:56:20 -0300
Subject: [Buildroot] OLSR in buildroot - patch 06...may be?
Message-ID: <a63ecaf0709191256ya56a745n8bf3798892311892@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

What file .config? buldroot/.config?
There are not any more .config file in $(OLSR_DIR)

>+olsr-clean:
>+      rm -f $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
>+      rm -f $(TARGET_DIR)/$(OLSR_TARGET_PLUGIN)/olsrd_*.so.*
>+      rm -f $(TARGET_DIR)/etc/init.d/S50olsr
>+      -$(MAKE) -C $(OLSR_DIR) clean

I think that I already asked you to rm the .config file, didn't I? ;)
Please rm the .config file.


-- 
------------------------------------------------------
--- Timeo Danaos et dona ferentes ---
------------------------------------------------------
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070919/71dced73/attachment-0001.htm 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br2-add-olsr.06.patch
Type: text/x-patch
Size: 3946 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070919/71dced73/attachment-0001.bin 
