From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Feb 2012 09:13:47 +0100
Subject: [Buildroot] [PATCH 8/8] lttng-babeltrace: new package
In-Reply-To: <87vcnrh4c8.fsf@macbook.be.48ers.dk>
References: <cover.1328038759.git.thomas.petazzoni@free-electrons.com>
 <cover.1328038759.git.thomas.petazzoni@free-electrons.com>
 <8909ec4e636e84ac7cdf6a0b0c6c51c1bd36ccd6.1328038759.git.thomas.petazzoni@free-electrons.com>
 <87vcnrh4c8.fsf@macbook.be.48ers.dk>
Message-ID: <20120201091347.58a38efd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 31 Jan 2012 23:52:55 +0100,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> HOST_..._DEPENDENCIES are now automatically derived from _DEPENDENCIES
> by default, so this can be dropped.

Ah, yes, sorry. The patch has been written prior to the introduction of
this mechanism, and I forgot to check this point. Thanks for taking
care of reviewing and fixing!

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
