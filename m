From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Aug 2012 12:42:00 +0200
Subject: [Buildroot] [PATCH 2/4] zeromq: add license information
In-Reply-To: <1345406924-6574-2-git-send-email-spdawson@gmail.com>
References: <1345406924-6574-1-git-send-email-spdawson@gmail.com>
 <1345406924-6574-2-git-send-email-spdawson@gmail.com>
Message-ID: <20120821124200.59ffab03@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 19 Aug 2012 21:08:42 +0100,
spdawson at gmail.com a ?crit :

> +ZEROMQ_LICENSE = GPLv3+
> +ZEROMQ_LICENSE_FILES = COPYING

No. Most of ZeroMQ is apparently under the LGPLv3+, but the
COPYING.LESSER contains a special exception. This needs to be encoded
differently.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
