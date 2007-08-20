From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 20 Aug 2007 19:00:17 +0100
Subject: [Buildroot] [PATCH] Fix sed fail when building qtopia
Message-ID: <d6cda7730708201100l732f3131hc0eb086da6cb5ee2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,

   This patch should fix the error:
   sed: -e expression #1, char 21: unknown option to `s'

   I am sure there is a better way to do this, but I'm not comfortable
with shell scripts enough, so, if someone has a better solution, by
all means :)

Chears,
   Thiago A. Correa
-------------- next part --------------
A non-text attachment was scrubbed...
Name: fix-qtopia.patch
Type: application/octet-stream
Size: 1615 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070820/52757f95/attachment.obj 
