From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Nov 2013 09:10:30 +0100
Subject: [Buildroot] [PATCH for-2013.11] glibc/eglibc: remove reference
 to experimental from help text
In-Reply-To: <1384848007-8853-1-git-send-email-arnout@mind.be>
References: <1384848007-8853-1-git-send-email-arnout@mind.be>
Message-ID: <20131119091030.3fde0470@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Tue, 19 Nov 2013 09:00:07 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Since 924b8739da we no longer declare glibc and eglibc support as
> experimental, so it shouldn't be mentioned in the help text anymore.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  toolchain/toolchain-buildroot/Config.in | 6 ------
>  1 file changed, 6 deletions(-)

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
