From: Patricia Holden <pholden@nklabs.com>
Date: Tue, 20 Jul 2021 16:41:40 -0400
Subject: [Buildroot] Question about pkg-config pc files
Message-ID: <CAJ6EmCd=eJUrY5Qa_SyJd5mVRq0bKtmuQTB-j1HF1bXXZpZn3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <20210720204140.rBylFOX96S0bGSKpviTJTGch7yo5hDiMnGiJB6ydYJQ@z>

I am adding a package that has dependencies on QT pkg-config pc files.  I
see the pkg-config pc files in
output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/share/pkgconfig/, but
I don't see any pkg-config files installed to target.  the QQmlApplication
code is trying to include multiple qt packages but they are not found.
Running "pkg-config --list-all" results in none found at all.

How do I get pkg-config pc files installed to the target?

-- 
Patricia A. Holden
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210720/f76f6b20/attachment-0001.html>
