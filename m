From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Aug 2020 23:43:24 +0200
Subject: [Buildroot] [PATCH 1/1] package qemu: bump to version 5.1.0
In-Reply-To: <1597404324-18752-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1597404324-18752-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <20200816234324.11561529@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Aug 2020 13:25:24 +0200
Jugurtha BELKALEM <jugurtha.belkalem@smile.fr> wrote:

> Release 5.1.0 brought new changes like :
> - New architecture support for AVR CPUs
> - New ARMv8.2 TTS2UXN architecture feature support
> - Parameter 'mem' of the '-numa' option is not supported anymore.
> 
> See:
> https://wiki.qemu.org/ChangeLog/5.1
> https://www.qemu.org/2020/08/11/qemu-5-1-0/
> 
> Build results available at : https://gitlab.com/jugurthaB/buildroot/-/pipelines/177823315.
> 
> Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> ---
>  package/qemu/qemu.hash | 2 +-
>  package/qemu/qemu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
