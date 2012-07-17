From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 10:22:11 +0200
Subject: [Buildroot] [PATCH v3 2/2] libglib2: fix install even if the
 host python binary refers to python3
In-Reply-To: <1338674897-1810-2-git-send-email-s.martin49@gmail.com>
References: <1338674897-1810-1-git-send-email-s.martin49@gmail.com>
 <1338674897-1810-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20120717102211.0a8f59b9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun,  3 Jun 2012 00:08:17 +0200,
Samuel Martin <s.martin49@gmail.com> a ?crit :

> The libglib2's build system uses some python2 scripts in the install rules.
> 
> This patch ensures to have a valid host python2 binary and enforces this python2
> binary at configure-time.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Isn't there a way to make the libglib2 python script python2 *and*
python3 compatible?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
