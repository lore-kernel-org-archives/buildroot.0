From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Nov 2009 12:39:25 +0100
Subject: [Buildroot] [PATCH 4/8] flex: add flex-host package (required
 by webkit)
In-Reply-To: <1258279977-1482-5-git-send-email-llandwerlin@gmail.com>
References: <1258279977-1482-1-git-send-email-llandwerlin@gmail.com>
	<1258279977-1482-5-git-send-email-llandwerlin@gmail.com>
Message-ID: <20091115123925.0649e537@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Lionel,

Le Sun, 15 Nov 2009 11:12:53 +0100,
llandwerlin at gmail.com a ?crit :

>  $(eval $(call AUTOTARGETS,package,flex))
> +$(eval $(call AUTOTARGETS,package,flex,host))

Thanks for using so quickly the new autotools infrastructure! Have you
been able to use it with success ?

However, please note that if you depend on this new infrastructure,
your patches will not be integrated in the upcoming 2009.11 release,
because the new infrastructure is post-2009.11 material.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
