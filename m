From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 22:33:36 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/gtkmm3: reorder
 select/depends
In-Reply-To: <1451337814-16379-2-git-send-email-romain.naour@gmail.com>
References: <1451337814-16379-1-git-send-email-romain.naour@gmail.com>
 <1451337814-16379-2-git-send-email-romain.naour@gmail.com>
Message-ID: <20151228223336.0a9f9cdf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Mon, 28 Dec 2015 22:23:33 +0100, Romain Naour wrote:
> From: Romain Naour <romain.naour@openwide.fr>
> 
> From [1]:
> "Even though the ordering has absolutely no consequences in Kconfig, it
> is not logical (when reading). It is more logical and far easier to
> understand when depends come first, followed by the selects."
> 
> Also, the Config.in exemple in the manual suggest to use this coding
> style [2].
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2015-October/142955.html
> [2] http://buildroot.uclibc.org/downloads/manual/manual.html#writing-rules-config-in
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/gtkmm3/Config.in | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
