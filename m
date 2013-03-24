From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Sun, 24 Mar 2013 18:43:32 -0400 (EDT)
Subject: [Buildroot] [PATCH 1/2] texinfo: new host package
In-Reply-To: <1364164146-16517-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1111501726.1967.1364165012922.JavaMail.root@mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> The makeinfo program from texinfo is needed to get Crosstool-NG to
> build properly a toolchain. Long term, it would be great if
> Crosstool-NG supported building without texinfo, simply by disabling
> the build of documentation.

Just curious, isn't possible for the Crosstool-NG build to disable the
doc, with something like Gustavo did here for GCC:

http://git.buildroot.net/buildroot/commit/?id=62322acb2ce186d544ab21fe253ccc8561a68a48

Cheers,
Vivien
