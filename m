From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Nov 2015 14:26:39 +0100
Subject: [Buildroot] [PATCH 2/3] package/zmqpp: add patch to fix build
 issue
In-Reply-To: <1448052881-29222-2-git-send-email-joerg.krause@embedded.rocks>
References: <1448052881-29222-1-git-send-email-joerg.krause@embedded.rocks>
 <1448052881-29222-2-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20151122142639.50fdcbdf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Fri, 20 Nov 2015 21:54:40 +0100, J?rg Krause wrote:
> Add a patch from upstream to fix build error:
>   error: no match for 'operator<<'
> 
> Fixes:
> http://autobuild.buildroot.net/results/ed4508a00663b03632a4eb9411ba05852d02fd88/
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/zmqpp/zmqpp.hash | 1 +
>  package/zmqpp/zmqpp.mk   | 1 +
>  2 files changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
