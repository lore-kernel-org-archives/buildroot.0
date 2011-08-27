From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 27 Aug 2011 10:13:38 -0300
Subject: [Buildroot] [PATCH] mdev: Add auto-mounting support for USB and
 SD card
In-Reply-To: <1314419182-21753-1-git-send-email-plagnioj@jcrosoft.com>
References: <1314419182-21753-1-git-send-email-plagnioj@jcrosoft.com>
Message-ID: <28cd2ef34f796e8e58e96bd6a8dd681b@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 27 Aug 2011 06:26:22 +0200, Jean-Christophe PLAGNIOL-VILLARD 
wrote:

> this will mount the device in /media as
> /media/${MDEV}

I'd make it an option, there are many scenarios where you don't want 
devices automounting media.
Regards.
