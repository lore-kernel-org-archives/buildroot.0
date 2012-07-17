From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 11:52:40 +0200
Subject: [Buildroot] [PATCH v5 1/5] target: add symbols for i386/x86_64
 cpu features
In-Reply-To: <CAHXCMMK8_vif95DakvjAhV8RGmS=SLFuR1C=FoZLDFGn_oSDCg@mail.gmail.com>
References: <1342474650-10084-1-git-send-email-s.martin49@gmail.com>
 <1342474650-10084-2-git-send-email-s.martin49@gmail.com>
 <20120717111703.3adbb357@skate>
 <CAHXCMMK8_vif95DakvjAhV8RGmS=SLFuR1C=FoZLDFGn_oSDCg@mail.gmail.com>
Message-ID: <20120717115240.4c7f5b5c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 17 Jul 2012 11:43:58 +0200,
Samuel Martin <s.martin49@gmail.com> a ?crit :

> > Applied, after removing the depends on, and the SSE41/SSE42 options
> > that were unused. The other 4 patches were also applied, with no
> > changes.
> arf!... SSE41/SSE42 options are useb by the opencv patch that has just
> been merged.

Oops, I should have removed them from the OpenCV patch, my mistake.
Since those options are never selected, there is no reason to have code
from them in the OpenCV makefile.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
