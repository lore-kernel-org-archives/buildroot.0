From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Tue, 29 Jul 2008 14:14:59 +0200
Subject: [Buildroot] Bash failing
In-Reply-To: <8bf7d05b0807290449t58e05508yc8fe48edf12400a2@mail.gmail.com>
References: <8bf7d05b0807260046q35afd439kf3d0a8b950dc5344@mail.gmail.com>	
	<488D8691.6070904@cetrtapot.si>	
	<8bf7d05b0807280413t58506a27jcfcf36ae301de559@mail.gmail.com>	
	<488DC095.7000303@cetrtapot.si>	
	<8bf7d05b0807280833x7cace636xa2b41176d306b6be@mail.gmail.com>	
	<488EC7EF.4090203@cetrtapot.si>
	<8bf7d05b0807290449t58e05508yc8fe48edf12400a2@mail.gmail.com>
Message-ID: <488F09C3.2090205@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jonathan and Caroline Moore wrote:
> Here is my output - it seems it is not looking in the right places.

Just as I though so.

> 
> Is there a way to correct this or do I need to try and get buildroot
> to make a cross-compiler too?

Try attached patch.

HTH,
Hinko

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si

-------------- next part --------------
A non-text attachment was scrubbed...
Name: bash.diff
Type: text/x-patch
Size: 479 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080729/6ea3590e/attachment.bin 
