From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Sep 2015 19:48:27 +0200
Subject: [Buildroot] [PATCH] util-linux: show utilities alphabetically
 ordered
In-Reply-To: <1441113650-51415-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1441113650-51415-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150911194827.4edea02a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Tue, 1 Sep 2015 14:20:50 +0100, Vicente Olivert Riera wrote:
> The list of util-linux utilities we can find on its Config.in file it
> seems to be alphabetically ordered in purpose. However, there are some
> of them which are in the wrong place. This patch fixes that.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/util-linux/Config.in |   24 ++++++++++++------------
>  1 files changed, 12 insertions(+), 12 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
