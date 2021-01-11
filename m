From: Fabien LEHOUSSEL <fabien.lehoussel@medianesysteme.com>
Date: Mon, 11 Jan 2021 16:11:39 +0000
Subject: [Buildroot] BR2_PER_PACKAGE_DIRECTORIES : How to remove file
 installed from an other package
Message-ID: <D18CFEE6F046494E82855511759DF30ABCBDB79D@ikhexmbxc02n01.ikhex.ikoula.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am trying to remove files installed from a dependency package without success.

Before using  BR2_PER_PACKAGE_DIRECTORIES, I did like this :

PACKAGE2_CONF_DEPENDENCIES = package1

define PACKAGE2_INSTALL_TARGET_CMDS
                rm $(TARGET_DIR)/etc/init.d/XX
endef

I have tried with hooks without success

What is the solution to make this work with BR2_PER_PACKAGE_DIRECTORIES ?

Thanks

Best Regards

Fabien


Cordialement

Fabien Lehoussel
________________________________
Fabien LEHOUSSEL / Chef de Projets
M?diane Syst?me
54 Route de Sartrouville - 78232 Le Pecq Cedex
01.30.15.20.42 fabien.lehoussel at medianesysteme.com<mailto:fabien.lehoussel@medianesysteme.com>

[http://medianesysteme.com/images/Logos/Logo_HG.png]<https://www.medianesysteme.com/images/Logos/Logo_HG.png>



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210111/de17fc66/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: image001.png
Type: image/png
Size: 11688 bytes
Desc: image001.png
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210111/de17fc66/attachment.png>
