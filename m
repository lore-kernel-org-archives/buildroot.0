From: Julien Boibessot <julien.boibessot@free.fr>
Date: Fri, 14 Nov 2008 10:22:38 +0100
Subject: [Buildroot] [PATCH] Stops Linux building when modules compilation
	fails
Message-ID: <491D435E.5040505@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

At that time if Linux modules compilation fails, building process
continue and user don't see the related problems.
The attached patch resolves the issue but I'm not sure if it's the right
way to do it.

Regards,
Julien
-------------- next part --------------
A non-text attachment was scrubbed...
Name: kernel-modules-stop.patch
Type: text/x-patch
Size: 1159 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20081114/05fc00b9/attachment.bin 
