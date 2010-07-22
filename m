From: Ossy <ossy1980@gmx.net>
Date: Thu, 22 Jul 2010 23:59:25 +0200
Subject: [Buildroot] build of gcc 4.3.5 broken with
	BR2_GCC_USE_SJLJ_EXCEPTIONS
Message-ID: <4C48BF3D.4040301@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi mailinglist,

I don't need this particular option (BR2_GCC_USE_SJLJ_EXCEPTIONS) but 
anyway my buildroot version (current git tree) wasn't able to build 
4.3.5-final with BR2_GCC_USE_SJLJ_EXCEPTIONS=y. After deactivating it 
everything was fine again.

Maybe someone is able to reproduce this behaviour and file a bug.

Regards,
Marcus
