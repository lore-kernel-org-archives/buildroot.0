From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Feb 2014 17:04:56 +0100
Subject: [Buildroot] [pkg-perl infra V4 9/9] qemu: add a Config.in.host
In-Reply-To: <1391608380-23240-10-git-send-email-francois.perrad@gadz.org>
References: <1391608380-23240-1-git-send-email-francois.perrad@gadz.org>
 <1391608380-23240-10-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140205170456.2440f114@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Wed,  5 Feb 2014 14:53:00 +0100, Francois Perrad wrote:
> after the removal of cpanminus
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in.host      |    1 +
>  package/qemu/Config.in.host |   10 ++++++++++
>  2 files changed, 11 insertions(+)
>  create mode 100644 package/qemu/Config.in.host

I'm not sure this should be part of the Perl patch series. At the
meeting, I think we all agreed that building the Qemu user-mode
emulation for the host is not useful as it cannot work properly.
Instead the qemu package should build the system-mode emulation for the
host, which is something that Gustavo proposed some time ago.

So I'd say to leave Qemu on the side for now, and focus on the Perl
side of things in this patch series.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
