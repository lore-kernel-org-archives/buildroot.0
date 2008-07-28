From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Mon, 28 Jul 2008 10:42:57 +0200
Subject: [Buildroot] Bash failing
In-Reply-To: <8bf7d05b0807260046q35afd439kf3d0a8b950dc5344@mail.gmail.com>
References: <8bf7d05b0807260046q35afd439kf3d0a8b950dc5344@mail.gmail.com>
Message-ID: <488D8691.6070904@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jonathan and Caroline Moore wrote:
> Anyone able to help me out with these bash complaints please.
> 
> Jonathan (buildroot 20080725)
> 
> In file included from display.c:49:
> tcap.h:35:23: error: termcap.h: No such file or directory

This would suggest that termcap lib was a) not built prior to bash or b) the termcap.h is not present in staging folders.

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
