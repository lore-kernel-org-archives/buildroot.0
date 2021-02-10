From: Kiril Maler <kiril.maler@gmail.com>
Date: Wed, 10 Feb 2021 19:01:13 +0100
Subject: [Buildroot] PATCH package/nodejs: do not write in $HOME dir
Message-ID: <CABJxTWFfyu_KLnSCzTkhEO8N9wGb8EZtr6srw_Oj=Nab66Jo3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-nodejs will write a config file in $HOME/.config dir.
When BR2_PACKAGE_NODEJS_NPM_HOSTCONFIG_IN_BASEDIR is
selected, the config file will be written in $HOST_DIR/config
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210210/ecb906f4/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0015-nodejs-config-in-host-dir.patch
Type: text/x-patch
Size: 1841 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210210/ecb906f4/attachment.bin>
