From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Jul 2014 09:02:00 +0200
Subject: [Buildroot] [PATCH v2] toolchain: include C libraries in
 legal-info
In-Reply-To: <1406318787-3993-1-git-send-email-yann.morin.1998@free.fr>
References: <1406318787-3993-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140726090200.1295a526@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 25 Jul 2014 22:06:27 +0200, Yann E. MORIN wrote:
> So far, the legal-info infrastructure was not exporting the legal
> info for the C libraries. This is because the legal-info only acts
> on packages defined in $(TARGETS).
> 
> But the C libraries are never added to $(TARGETS), since there is no
> corresponding BR2_PACKAGE_<C-LIBRARY>.
> 
> This patch adds such symbols for the 4 C libraries we support in our
> internal backend: uClibc, glibc, eglibc and musl.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
