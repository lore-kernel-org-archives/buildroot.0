From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 13:56:31 +0200
Subject: [Buildroot] [PATCH v2] busybox: bump to version 1.24.0
In-Reply-To: <1444813483-47182-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1444813483-47182-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151014135631.79d1e47a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 14 Oct 2015 10:04:43 +0100, Vicente Olivert Riera wrote:
> Disable CONFIG_FEATURE_SYNC_FANCY in the busybox.config because that
> option causes build failures for any uClibc based toolchains since it
> requires syncfs() support, which doens't exist in uClibc.
> 
> This new option has been introduced in 1.24.0, so despite of disabling
> it, we are not losing anything that we had before.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v1 -> v2:
>   - Fix the CONFIG_FEATURE_SYNC_FANCY issue (Gustavo Zacarias)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
