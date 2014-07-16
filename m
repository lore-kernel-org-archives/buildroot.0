From: =?ISO-8859-1?Q?J=F6rg_Krause?= <jkrause@posteo.de>
Date: Wed, 16 Jul 2014 13:44:49 +0200
Subject: [Buildroot] git binary diffs are not supported
Message-ID: <53C665B1.6050609@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I am trying to apply a git binary patch to add a firmware binary blob to 
the linux kernel firmware directory. I am using git format-patch 
--binary -M -n -s to create the patch and copy it to the global patch 
directory. Trying to build linux fails while patching with the following 
error message:

    git binary diffs are not supported.

Do I missed something? I would be glad for any advice!

Best regards
J?rg Krause
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140716/1b53b19d/attachment.html>
