From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 23:09:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/yaml-cpp: disable testing and
 parse tools
In-Reply-To: <1438281586-18052-1-git-send-email-joerg.krause@embedded.rocks>
References: <1438281586-18052-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150730230921.5a63db93@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Thu, 30 Jul 2015 20:39:46 +0200, J?rg Krause wrote:
> The gmock testing framework uses fork() and therefor yaml-cpp fails to build
> for a MMU-less targets. Since we are only interested in building the yaml-cpp
> library we disable the testing and parse tools (command line tools).
> 
> Fixes:
> http://autobuild.buildroot.net/results/2ce/2ce3c6d0140696cdf73f2ad1499b779c83ad8f6e/
> 
> Cc: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/yaml-cpp/yaml-cpp.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
