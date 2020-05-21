From: Jan Pohanka <xhpohanka@gmail.com>
Date: Thu, 21 May 2020 14:09:28 +0200
Subject: [Buildroot] libstc++ library duplicate
Message-ID: <CABMiYf-NwX6FsSif7yDbp3JLMFMfmiFEAaqU-A_Yv3apun3TGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm trying to decrease size of my root filesystem and noticed that
libstdc++ library is installed twice. One in /lib and the same one in
/usr/lib.

They are installed by external-toolchain

toolchain-external-arm-arm,./lib/libstdc++.so.6
toolchain-external-arm-arm,./lib/libstdc++.so.6.0.28
toolchain-external-arm-arm,./lib/libstdc++.so.6.0.28-gdb.py
toolchain-external-arm-arm,./usr/lib/libstdc++.so.6
toolchain-external-arm-arm,./usr/lib/libstdc++.so.6.0.28
toolchain-external-arm-arm,./usr/lib/libstdc++.so.6.0.28-gdb.py

Is that correct? Can I drop one?

thanks
Jan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200521/183fa38a/attachment.html>
