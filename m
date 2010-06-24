From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Jun 2010 09:23:07 +0200
Subject: [Buildroot] make linux26-force
In-Reply-To: <0D753D10438DA54287A00B027084269763716C534F@AUSP01VMBX24.collaborationhost.net>
References: <0D753D10438DA54287A00B027084269763716C534F@AUSP01VMBX24.collaborationhost.net>
Message-ID: <20100624092307.38486bc6@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 23 Jun 2010 17:59:33 -0500
H Hartley Sweeten <hartleys@visionengravers.com> wrote:

> Is there a reason make linux26-force was removed by the linux-cleanup commit?

Because I haven't seen the use case for that. Which use case does this
solve ?

The kernel already gets rebuilt whenever its .config file is changed
(by means of linux26-menuconfig, linux26-xconfig, or directly). Isn't
this enough ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
