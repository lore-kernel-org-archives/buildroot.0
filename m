From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Aug 2012 15:41:10 +0200
Subject: [Buildroot] [PATCH 2/2] Provide PAM configuration files in the
 fs skeleton
In-Reply-To: <1344911089-31197-2-git-send-email-golubovsky@gmail.com>
References: <1344911089-31197-1-git-send-email-golubovsky@gmail.com>
 <1344911089-31197-2-git-send-email-golubovsky@gmail.com>
Message-ID: <20120814154110.4a74a4e1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 13 Aug 2012 22:24:49 -0400,
Dmitry <golubovsky@gmail.com> a ?crit :

> The default PAM configuration file requires valid user accounts with
> non-blank passwords.
> 
> The PAM configuration file for busybox login allows local authentication
> with blank passwords thus emulating the non-PAM login configuration.
> 
> Signed-off-by: Dmitry <golubovsky@gmail.com>

Thanks!

I'm not sure we want these in the default fs skeleton. Shouldn't the
linux-pam package install these instead?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
