From: Montes, Jacques <Jacques.Montes@wavecom.com>
Date: Fri, 10 Oct 2008 19:18:58 +0200
Subject: [Buildroot] ARM.extab section required for elf2flt
Message-ID: <86C6E24AEF127E40984B146FB917A60F04795ABE@FRILMEX01.wm.corp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm using an ARM mmu less toolchain generated with buildroot and with elf2flt.

Everything seems to go well toolchain / uclibc / busybox / root File System , but I want to compile a simple main application, the linker complains about the ARM.extab section which is not present in the elf2flt.ld.

 

I had to make a workaround for elf2flt because it is not installed in the correct staging_dir/usr directory, but is seems to work.

 

Thanks

 

 

 

  <http://www.wavecom.com> 

Jacques Montes
Technical Marketing Manager
jacques.montes at wavecom.com <mailto:jacques.montes@wavecom.com> 
Tel: +33 1 46 29 43 73
Fax: +33 1 46 29 40 55
Mobile: +33 6 10 58 57 52 

Wavecom S.A.
3 esplanade du Foncet
Issy-les-Moulineaux
92442 Cedex - France
www.wavecom.com <http://www.wavecom.com>  

This message and any attachments (the "Message") are confidential and intended solely for the addressees. Any unauthorized modification, edition, use or dissemination is prohibited. Neither Wavecom nor any of its subsidiaries shall be liable for the Message if altered, changed, falsified or edited, diffused without authorization. 

Ce message et toutes les pi?ces jointes (le "Message") sont confidentiels et ?tablis ? l'intention exclusive de ses destinataires. Toute modification, ?dition, utilisation ou diffusion non autoris?e est interdite. Wavecom et ses filiales d?clinent toute responsabilit? au titre de ce Message s'il a ?t? alt?r?, d?form?, falsifi? ou ?dit?, diffus? sans autorisation.

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081010/7ce246be/attachment.htm 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: image/gif
Size: 4050 bytes
Desc: image001.gif
Url : http://busybox.net/lists/buildroot/attachments/20081010/7ce246be/attachment.gif 
