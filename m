From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 18:10:11 +0100
Subject: [Buildroot] [PATCH 0/5] Fix libnl static linking
In-Reply-To: <1425728422-14113-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425728422-14113-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150315181011.44bd1206@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 Mar 2015 12:40:17 +0100, Thomas Petazzoni wrote:

> Thomas Petazzoni (5):
>   libnl: use the backported patch for poll.h issue
>   libnl: add patch to add Libs.private in libnl-3.0.pc

Applied.

>   ti-utils: simplify static linking case by using pkg-config
>   iw: simplify static linking handling

Applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
