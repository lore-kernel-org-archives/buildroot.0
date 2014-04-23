From: William Frost <tsmrnd0@gmail.com>
Date: Wed, 23 Apr 2014 16:11:54 +0900
Subject: [Buildroot] add ghostscript to buildroot
Message-ID: <6387189.ReKiMDKImK@linux-qsenn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I have been working with buildroot for little more than one year. I think is 
great tool. Some months ago I needed to cross-compile DCMTK library (it is not 
included in buildroot) for DICOM image file management and PACS connectivity. 
By following your online help I managed to add this package and successfully 
cross-compile and use it (if needed I can provide the files just let me know 
how).

Anyway, at this moment I need to cross-compile GhostScript (any version is 
good enough for me). But this is really complicated, I'm getting errors every 
where. I notice that openwrt has already included GhostScript 
(https://code.google.com/p/wl500g-repo/source/browse/feeds/rtndev/ghostscript/Makefile?r=1336
) so at this moment I'm trying to port this package to buildroot. Buildroot 
and ?openwrt buildroot? are similar tools so I guess that with some 
modifications it can be added to Buildroot. But my Buildroot knowledge it not 
that good (I hope with more time and practice it gets better ;)).

I need GhostScript to convert ps files to the file that will be sent to the 
printer (I don?t know this format name). I already have a ppd parser, so I 
just need to convert the ps file to the other format to open ?/dev/usb/lp0? and 
write it inside. 

Question:

Is there any interest in adding Ghostscript package to buildroot in the near 
future?
Does anyone has some hints about porting packages from openwrt to buildroot 
that I can use as guide?

Thank you very much for your attention.
William Frost
