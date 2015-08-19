From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Aug 2015 12:07:15 +0200
Subject: [Buildroot] how to configure the ip address of beaglebone?
In-Reply-To: <CA+yqE7_Xk94ePiraMptq7-bv+6svqY1i5JCtzimMcK6kPC5jWA@mail.gmail.com>
References: <CA+yqE79AfRuHWa26Sg6zcs8YYjxx1y-Khdp6nY1L5C_uXsevMQ@mail.gmail.com>
 <20150819111224.1126ad7c@free-electrons.com>
 <CA+yqE78WYbzyA9QcQ0ZwdRJZc4_yidePmuXQ2T9CUG-f8r3q+A@mail.gmail.com>
 <20150819115212.61ed0b97@free-electrons.com>
 <CA+yqE7_Xk94ePiraMptq7-bv+6svqY1i5JCtzimMcK6kPC5jWA@mail.gmail.com>
Message-ID: <20150819120715.469e52e5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hmidi Slim,

On Wed, 19 Aug 2015 11:56:31 +0200, Hmidi Slim wrote:

> >>>   Copying overlay board/felabs/beagleboneblack/rootfs-overlay
> rsync: change_dir
> "/home/slim/Bureau/projet_stage/buildroot//board/felabs/beagleboneblack/rootfs-overlay"
> failed: No such file or directory (2)

I think this error message is clear. The path of the rootfs overlay you
specified in the Buildroot configuration does not exist.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
