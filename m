From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Mar 2012 07:53:05 +0100
Subject: [Buildroot] [PATCH] Add (Freescale) elftosb host package
In-Reply-To: <73E430A1-7C75-4E82-9A74-5771BC39AB48@armadeus.org>
References: <1331560507-12444-1-git-send-email-eric.jarrige@armadeus.org>
 <20120312183241.56f78a30@skate>
 <73E430A1-7C75-4E82-9A74-5771BC39AB48@armadeus.org>
Message-ID: <20120313075305.47f9f00c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 13 Mar 2012 00:13:53 +0100,
Eric Jarrige <eric.jarrige@armadeus.org> a ?crit :

> I have the plan to send another patch to support the u-boot.sb binary file
> format that will depend on this host tool. 

Ok, good. Would it be possible to post the patch adding the elftosb
tool together with a patch adding this u-boot.sb support? Of course,
this should be two separate patches, but sent together.

> The new apf28 board will also use this .sb binary file format and the elftosb
> tool. It also possible to package the linux kernel with this tool for some CPUs
> but for the time being that is not in my plan.
> I do not know if this can be useful to have it in a user submenu.

As long as it is used somewhere as a dependency for something, then
it's fine.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
