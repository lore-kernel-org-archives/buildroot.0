From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 20:14:05 +0200
Subject: [Buildroot] [PATCHv3] package/gcc: cleanup arch/cpu combinations
In-Reply-To: <1411407141-14843-1-git-send-email-gustavo@zacarias.com.ar>
References: <1411407141-14843-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140923201405.3a2aa98b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 22 Sep 2014 14:32:21 -0300, Gustavo Zacarias wrote:
> Cleanup arch/cpu combination limits, we had super-wide depends and it
> doesn't help readability, version bumps or testing.
> 
> Make the bool/depends/select order the same for all entries.
> 
> Drop redundant limitations, for example sparc* if sparc wasn't
> supported in general.
> 
> Power8 requires at least gcc 4.9.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gcc/Config.in.host | 84 ++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 67 insertions(+), 17 deletions(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
