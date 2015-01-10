From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 17:53:23 +0100
Subject: [Buildroot] [PATCH v3 2/2] mpd: group client and libraries
 under the same menu
In-Reply-To: <1418419480-7570-2-git-send-email-tbultel@free.fr>
References: <1418419480-7570-1-git-send-email-tbultel@free.fr>
 <1418419480-7570-2-git-send-email-tbultel@free.fr>
Message-ID: <20150110175323.680f85d0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thierry Bultel,

On Fri, 12 Dec 2014 22:24:40 +0100, Thierry Bultel wrote:
> Signed-off-by: Thierry Bultel <tbultel@free.fr>
> ---
>  package/Config.in     |  6 ------
>  package/mpd/Config.in | 21 +++++++++++++++++++++
>  2 files changed, 21 insertions(+), 6 deletions(-)

We don't typically try to create categories for such a small number of
packages. I've asked Yann and Gustavo, and they agree with this
opinion. So I'm sorry, but we'll reject this patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
