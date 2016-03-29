From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 14:46:11 +0200
Subject: [Buildroot] [PATCH] libgtk3: bump to version 3.20.1
In-Reply-To: <1458924831-25952-1-git-send-email-gustavo@zacarias.com.ar>
References: <1458924831-25952-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160329144611.5a8bb856@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 25 Mar 2016 13:53:51 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libgtk3/libgtk3.hash | 4 ++--
>  package/libgtk3/libgtk3.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Looks like the Wayland support needs memfd, which is available only if
fairly recent kernel versions:

  http://autobuild.buildroot.org/results/473/473fb2f416311ee8a8a8719e3fb3689d9226f451/build-end.log

Probably needs some linux headers version dependency. Could you look
into this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
