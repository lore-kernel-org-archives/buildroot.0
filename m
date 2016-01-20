From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jan 2016 10:59:16 +0100
Subject: [Buildroot] [PATCH v4 2/3] toolchain/external: add MIPS
 Codescape MTI GNU Linux toolchain
In-Reply-To: <1450196485-19214-2-git-send-email-Vincent.Riera@imgtec.com>
References: <1450196485-19214-1-git-send-email-Vincent.Riera@imgtec.com>
 <1450196485-19214-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160120105916.5f86c027@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente,

On Tue, 15 Dec 2015 16:21:24 +0000, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v3 -> v4:
>  - Move the changes to helpers.mk into a separate patch.

I've applied patches 2 and 3 to add the two MIPS Codescape toolchains,
after rebasing on top of master, and removing the version number of the
Config.in options.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
