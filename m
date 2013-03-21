From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Mar 2013 15:38:18 +0100
Subject: [Buildroot] [PATCH] syslinux: bump to version 4.06
In-Reply-To: <AAF80B7BDF694E6DBABDD00C430E416E@beraninstruments.com.local>
References: <1363731698-15414-1-git-send-email-daniel.price@gmail.com>
 <AAF80B7BDF694E6DBABDD00C430E416E@beraninstruments.com.local>
Message-ID: <20130321153818.54e62189@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Will Moore,

On Thu, 21 Mar 2013 14:25:40 -0000, Will Moore wrote:

> I have tested this on my vortex86dx 32 bit x86 clone booting from a USB flash
> drive and it works for me.  But how *should* I use git to add a Tested-by line
> to the patch?  Your git advice welcomed ...

There's nothing that involves git to add your Tested-by line. Just
reply to Daniel's e-mail, quoting the commit log and his Signed-off-by
line, and add your own:

Tested-by: My Name <my.name@somewhere.com>

Our patchwork will automatically picks this up (unfortunately including
this one, so Peter will have to remove it), and it will be part of the
commit Peter will make.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
