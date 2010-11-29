From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Nov 2010 21:54:16 +0100
Subject: [Buildroot] handling package souce in .zip file
In-Reply-To: <4CF40789.70905@gmail.com>
References: <AANLkTinM+8TXLvddMZopiOOV_i-GR2+-z-k8s_6WY_UJ@mail.gmail.com>
	<1290800123.14151.49.camel@coalu.atr>
	<AANLkTi==3zifJ5J6eToFRvVTTBvPh0zx2FW=qn_jrXrH@mail.gmail.com>
	<1290814537.14151.55.camel@coalu.atr> <4CF40789.70905@gmail.com>
Message-ID: <20101129215416.72c2bb65@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 29 Nov 2010 22:05:29 +0200
Paulius Zaleckas <paulius.zaleckas@gmail.com> wrote:

> As you can see $(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE)
> output is piped to tar...

This can obviously be changed if needed.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
