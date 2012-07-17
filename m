From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 09:33:12 +0200
Subject: [Buildroot] [PATCH v5 1/5] target: add symbols for i386/x86_64
 cpu features
In-Reply-To: <1342474650-10084-2-git-send-email-s.martin49@gmail.com>
References: <1342474650-10084-1-git-send-email-s.martin49@gmail.com>
 <1342474650-10084-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20120717093312.5ea8e89e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 16 Jul 2012 23:37:26 +0200,
Samuel Martin <s.martin49@gmail.com> a ?crit :

> +# i386/x86_64 cpu features
> +config BR2_X86_CPU_HAS_MMX
> +	depends on BR2_i386 || BR2_x86_64
> +	bool

Is there any reason to have all those depends on BR2_i386 || BR2_x86_64
on those hidden options? Since they are hidden and only selected by
i386/x86_64 options, I don't think there's a point in keeping those
dependencies. If you agree, I can just fix that up when committing.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
