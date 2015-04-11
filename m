From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Apr 2015 11:57:35 +0200
Subject: [Buildroot] [PATCH 0/2] package/lame: Fix compile on 32bit Intel
	with gcc-4.9.x
Message-ID: <1428746257-29810-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this patch series supersedes
http://patchwork.ozlabs.org/patch/380574/
http://patchwork.ozlabs.org/patch/385267/

The first patch allows to autoreconf lame which is needed for the second patch
which really fixes the compile bug.

Regards, Bernd

Bernd Kuhls (2):
  package/lame: Fix autoreconf
  package/lame: Fix compile on 32bit Intel

-- 
1.7.10.4
