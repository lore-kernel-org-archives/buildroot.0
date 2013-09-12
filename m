From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Sep 2013 20:28:08 +0200
Subject: [Buildroot] [PATCH v3 1/3] package/Makefile.in: add a way to
 don't force jobs in sub-make
In-Reply-To: <1378799164-28645-2-git-send-email-fabio.porcedda@gmail.com>
References: <1378799164-28645-1-git-send-email-fabio.porcedda@gmail.com>
 <1378799164-28645-2-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20130912202808.54774c37@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Tue, 10 Sep 2013 09:46:02 +0200, Fabio Porcedda wrote:
> When the "BR2_JLEVEL" variable is empty use "make"
> without the "-j" option.
> To be able to use top-level parallel make we must don't force
> the number of jobs in sub-make.
> 
> Example:
> 	make BR2_JLEVEL= -j8
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
