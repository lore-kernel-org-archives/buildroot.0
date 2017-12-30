From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Dec 2017 18:32:32 +0100
Subject: [Buildroot] [PATCH v2] libiio: fix libavahi-client dependency
In-Reply-To: <20171227123555.15388-1-marcus.folkesson@gmail.com>
References: <20171227123555.15388-1-marcus.folkesson@gmail.com>
Message-ID: <20171230183232.596e49d2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Dec 2017 13:35:55 +0100, Marcus Folkesson wrote:
> Avahi needs avahi-daemon and D-Bus to build avahi-client.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
> v2:
> - Do not check for AVAHI as it is implicity checked by
>   AVAHI_DAEMON

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
