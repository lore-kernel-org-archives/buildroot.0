From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jan 2016 12:02:26 +0100
Subject: [Buildroot] [PATCH 1/2] package/lttng-tools: reorder 'select'
 vs 'depends on'
In-Reply-To: <1453546342-14457-1-git-send-email-s.martin49@gmail.com>
References: <1453546342-14457-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20160123120226.771c57b6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sat, 23 Jan 2016 11:52:21 +0100, Samuel Martin wrote:
> Place 'depends on' statements before 'select' ones.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/lttng-tools/Config.in | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Both applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
