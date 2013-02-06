From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Feb 2013 10:32:44 +0100
Subject: [Buildroot] [PATCH] boost: bump version to 1.53.0
In-Reply-To: <1360143004-29603-2-git-send-email-victor.hiairrassary.ml@gmail.com>
References: <1360143004-29603-1-git-send-email-victor.hiairrassary.ml@gmail.com>
 <1360143004-29603-2-git-send-email-victor.hiairrassary.ml@gmail.com>
Message-ID: <20130206103244.68ca56b4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear victor.hiairrassary.ml at gmail.com,

On Wed,  6 Feb 2013 10:30:04 +0100, victor.hiairrassary.ml at gmail.com
wrote:

>  BOOST_FLAGS =
> -BOOST_WITHOUT_FLAGS = python context
> +BOOST_WITHOUT_FLAGS = python atomic

Maybe there was a reason why "context" was unconditionally excluded
from the build, before your patch. Did you check why?

Also, it would be good to have a comment here that explains why python
and atomic are unconditionally excluded for the build.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
