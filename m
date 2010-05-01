From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 May 2010 13:15:51 +0200
Subject: [Buildroot] [pull request] directfb/linux-fusion bumps + lirc
 integration
In-Reply-To: <1272589129-21443-1-git-send-email-llandwerlin@gmail.com>
References: <1272589129-21443-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <20100501131551.67cb7744@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 30 Apr 2010 02:58:43 +0200
llandwerlin at gmail.com wrote:

> Available at :
>            git://git.potipota.net/buildroot 2010.05-directfb-lirc

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

There are a few strange things in the linux-fusion package (no
BUILD_CMDS variable, strange relation to the kernel variable), but I
think we can merge as it is and improve later if needed.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
