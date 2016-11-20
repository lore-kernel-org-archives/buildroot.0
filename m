From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Nov 2016 15:49:23 +0100
Subject: [Buildroot] [PATCH 1/2] kvm-unit-tests: pass the --processor
 configure argument
In-Reply-To: <20161120135006.19498-1-arnout@mind.be>
References: <20161120135006.19498-1-arnout@mind.be>
Message-ID: <20161120154923.3a90693d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Nov 2016 14:50:05 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The configure script uses this to set the -mcpu option. If nothing is
> passed, it defaults to -mcpu=cortex-a15 for arm, and -mcpu=cortex-a57
> for aarch64, which may conflict with the actual architecture.
> 
> The --processor option is only really used for arm and aarch64, but it
> doesn't hurt to also pass it for the other arches.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/kvm-unit-tests/kvm-unit-tests.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
