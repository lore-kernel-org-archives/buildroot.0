From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Sep 2011 08:54:22 +0200
Subject: [Buildroot] buildroot-2011.08, crosstool-ng-1.12.1, and Samba
In-Reply-To: <4E60F680.4040401@telesoft.com>
References: <4E600F20.7010606@telesoft.com> <20110902090739.373ab82f@skate>
 <4E60F680.4040401@telesoft.com>
Message-ID: <20110905085422.1677d8f1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 02 Sep 2011 08:30:08 -0700,
Scott Dudley <scott@telesoft.com> a ?crit :

>   crosstool-ng v1.12.1

Ok. So the problem is the one I highlighted. Can you try to copy
$(O)/staging/usr/lib/gconv to $(O)/target/usr/lib/gconv and see if
Samba works better ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
