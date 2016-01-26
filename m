From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 21:28:08 +0100
Subject: [Buildroot] [PATCH 00/21] Rework atomic handling
In-Reply-To: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160126212808.3bfc829b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Following the reviews, I've applied:

On Mon, 25 Jan 2016 00:07:46 +0100, Thomas Petazzoni wrote:

>   libftdi: C++ bindings need boost
>   libftdi: remove BR2_ARCH_HAS_ATOMICS dependency

[...]

>   icu: remove BR2_ARCH_HAS_ATOMICS dependency

[...]

All other patches have received comments, or depend on patches that have
comments.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
