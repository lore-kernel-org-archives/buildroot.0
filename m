From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 24 Jul 2012 09:23:42 +0100
Subject: [Buildroot] [PATCH v3] Bump gpsd from version 2.95 to version
	3.7
In-Reply-To: <20120724101103.6a11efda@skate>
References: <1343071776-1689-1-git-send-email-spdawson@gmail.com>
 <20120724084545.6c0cedab@skate> <20120724101103.6a11efda@skate>
Message-ID: <CAHt8ZCNtCKA+KCvEaubBEwvfkDzLaSpCsUSLa2cU1G_pPY1+fw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas; thanks for testing this.

I've reproduced the profiling problem with uClibc (Buildroot
toolchain). But I haven't managed to reproduce the other build
problems yet (using Linaro 2012.02 toolchain). I wonder if it might be
better to revert this for the time being; what do you think?

Simon.
