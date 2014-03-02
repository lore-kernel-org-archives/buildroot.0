From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 16:35:00 +0100
Subject: [Buildroot] [PATCH 1/3] lvm2: Enable cmdlib and dmeventd
In-Reply-To: <1391508365-30961-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1391508365-30961-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140302163500.60260e0d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Tue,  4 Feb 2014 11:06:03 +0100, Maxime Hadjinlian wrote:
> In order to use a newer dmraid, the lvm2 package needs
> to be compiled with --enable-cmdlib --enable-dmeventd, which
> dmraid can then invoke on boot.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Antony Vennard <arv@vx9.co.uk>

Applied this patch as well as PATCH 2/3 and 3/3 in this series, after
making minor formatting changes.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
