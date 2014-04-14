From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 23:54:55 +0200
Subject: [Buildroot] [PATCH v4 1/2] flite: new package
In-Reply-To: <1397410895-2290-1-git-send-email-s.martin49@gmail.com>
References: <1397410895-2290-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20140414235455.210e8db4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 13 Apr 2014 19:41:34 +0200, Samuel Martin wrote:
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: Eric Jarrige <eric.jarrige@armadeus.org>
> Cc: Julien Boibessot <julien.boibessot@armadeus.com>

Applied, after doing two changes. See below.


> +	  Flite (festival-lite) is a small, fast run-time synthesis engine
> +	  developed at CMU and primarily designed for small embedded machines
> +	  and/or large servers. Flite is designed as an alternative synthesis
> +	  engine to Festival for voices built using the FestVox suite of voice
> +	  building tools.

I've rewrapped that to use a smaller number of columns.

> +	  http://www.speech.cs.cmu.edu/flite
> +
> +comment "flite require a toolchain with WCHAR support"

RTFM: this was not the right format for such comments ;-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
