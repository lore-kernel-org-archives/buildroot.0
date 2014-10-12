From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 17:17:52 +0200
Subject: [Buildroot] [PATCH 1/3] qemu-system: new package
In-Reply-To: <1399148415-27648-1-git-send-email-gustavo@zacarias.com.ar>
References: <1399148415-27648-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141012171752.29414e94@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat,  3 May 2014 17:20:13 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in.host             |  1 +
>  package/qemu-system/Config.in.host | 30 ++++++++++++++++++
>  package/qemu-system/qemu-system.mk | 64 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 95 insertions(+)
>  create mode 100644 package/qemu-system/Config.in.host
>  create mode 100644 package/qemu-system/qemu-system.mk

We discussed this patch series during the Buildroot meeting. PATCH 3/3
is Superseded, as you have updated the Qemu defconfigs many time since
then.

Regarding PATCH 1/3 and PATCH 2/3, we continue to believe it should be
part of the qemu package itself, and not a separate qemu-system. Since
I know you are not interested in doing this work, Yann E. Morin has
said he was interested in doing this, once his current patch series
adding support for qemu-system on the target has been merged.

Consequently, I will mark your patches as 'Changes Requested' in
patchwork. Of course, if in the mean time you change your mind and
decide to implement host qemu-system as part of the qemu package, we'd
be happy to receive your patches! :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
