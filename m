From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Aug 2016 23:58:44 +0200
Subject: [Buildroot] [PATCH v2] openblas: P5600 and I6400 cores only
 available for Codescape toolchains
In-Reply-To: <1468843539-29696-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1468843539-29696-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160806235844.45a24ba2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Jul 2016 13:05:39 +0100, Vicente Olivert Riera wrote:
> These two MIPS cores are built with MSA support (-mmsa) which is
> currently in GCC trunk. The only toolchains that support it right now
> are Codescape MTI and Codescape IMG from Imagination Technologies.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/af5/af5e9f10287aaf9b9be6228ad7d12b2d926f8051/
>   http://autobuild.buildroot.net/results/b20/b201e4072b0b634d5ac86781aee24c698f88d689/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v1 -> v2:
>  - Amend commit log: s/Imagiation/Imagination/

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
