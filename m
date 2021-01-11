From: Fabien LEHOUSSEL <fabien.lehoussel@medianesysteme.com>
Date: Mon, 11 Jan 2021 16:15:51 +0000
Subject: [Buildroot] BR2_PER_PACKAGE_DIRECTORIES : How to remove file
 installed from an other package
Message-ID: <D18CFEE6F046494E82855511759DF30ABCBDB7B3@ikhexmbxc02n01.ikhex.ikoula.com>
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

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210111/1cc8f723/attachment.html>
