From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 21:32:43 +0100
Subject: [Buildroot] [PATCH] zbar: add a patch to wrap logical not
 operations into parenthesis
In-Reply-To: <1453724270-22823-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1453724270-22823-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160126213243.1c09588e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 25 Jan 2016 12:17:50 +0000, Vicente Olivert Riera wrote:
> This fixes build failures like this one:
> 
> zbar/decoder/ean.c: In function 'ean_part_end4':
> zbar/decoder/ean.c:297:13: error: logical not is only applied to the
> left hand side of comparison [-Werror=logical-not-parentheses]
>      if(!par == fwd) {
> 
> This patch has been sent upstream as a pull request:
> 
>   https://github.com/ZBar/ZBar/pull/9
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/299/299dc845af082167085d366b38daf1dfd95d7047/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  ...p-logical-not-operations-into-parentheses.patch | 80 ++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 package/zbar/0004-Wrap-logical-not-operations-into-parentheses.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
