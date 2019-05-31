From: Thomas Huth <huth@tuxfamily.org>
Date: Fri, 31 May 2019 08:13:07 +0200
Subject: [Buildroot] [PATCH v2 1/7] package/qemu: enable nios2 support
 for host-qemu
In-Reply-To: <1557075239-30667-2-git-send-email-jugurtha.belkalem@smile.fr>
References: <1557075239-30667-1-git-send-email-jugurtha.belkalem@smile.fr>
 <1557075239-30667-2-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <20190531081307.13a6dd4f@thl530.multi.box>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun,  5 May 2019 18:53:53 +0200
schrieb Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>:

> This config enable host eqmu support for nios2 which
> allows to test this architecture in gitlab.

s/eqmu/qemu/

with that fixed:

Reviewed-by: Thomas Huth <huth@tuxfamily.org>
