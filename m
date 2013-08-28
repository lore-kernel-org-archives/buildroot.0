From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Aug 2013 18:18:18 +0200
Subject: [Buildroot] [PATCH v2 0/2] Introducing Nios-II architecture
In-Reply-To: <1377115128-29749-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1377115128-29749-1-git-send-email-ezequiel.garcia@free-electrons.com>
Message-ID: <20130828181818.2efd6bf5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Wed, 21 Aug 2013 16:58:46 -0300, Ezequiel Garcia wrote:
> From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> 
> This is the second version of the series adding basic support for
> Altera's Nios-II architecture.
> Only basic support added so far, but more patches will hopefully follow.

Nice!

Once this series is committed, I'll add NIOS-II to the autobuilders.
Are you willing to look at the resulting package build failures?

What's nice is that the toolchain is modern: gcc 4.7, glibc 2.17,
binutils 2.23. Hopefully, this will mean that the number of issues
should not be too huge.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
