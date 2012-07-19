From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Jul 2012 13:30:38 +0200
Subject: [Buildroot] [PATCH v4 00/22] Automatically produce legal
 compliance info
In-Reply-To: <5007DD67.9090001@lucaceresoli.net>
References: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
 <20120717193610.638fabb2@skate> <20120717205803.1dca9f8c@skate>
 <5007DD67.9090001@lucaceresoli.net>
Message-ID: <20120719133038.42ed6ce7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 19 Jul 2012 12:11:51 +0200,
Luca Ceresoli <luca@lucaceresoli.net> a ?crit :

> I'm quickly looking at the latest daily autobuild e-mail reports, and I
> don't see evidence of any failure. But, in order to be sure, is there a
> specific error message for make legal-info? Maybe a specific string in the
> "Failure reason" line?

Well, so far there doesn't seem to be any failure related to the
legal-info mechanism. I just do "make legal-info" at the end of the
build if the build was successful, and if "make legal-info" fails, the
build would be reported as failed. The failure reason would then
contain the "make error" line.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
