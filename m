From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 15:30:26 +0200
Subject: [Buildroot] [PATCH 12/34] reproducibility/wireshark: remove
 documentation
In-Reply-To: <1462002570-14706-12-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-12-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160507153026.7522d667@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Apr 2016 09:49:08 +0200, Gilles Chanteperdrix wrote:
> HTML documentation contains a link to a mail address specific to
> the distribution of the build machine. Remove html documentation
> from the rootfs as it is unlikely to be needed. At this chance
> also remove the txt documentation.
> ---
>  package/wireshark/wireshark.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

If this one had your Signed-off-by, I could have applied it. Can you
respin?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
