From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 23:43:13 +0100
Subject: [Buildroot] [PATCH 1/1] raptor: install package to staging
In-Reply-To: <287040233.7034245.1487068674711@mail.yahoo.com>
References: <287040233.7034245.1487068674711.ref@mail.yahoo.com>
 <287040233.7034245.1487068674711@mail.yahoo.com>
Message-ID: <20170215234313.032eb488@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Feb 2017 10:37:54 +0000 (UTC), Erwan Gautron wrote:
> Signed-off-by: Erwan Gautron <erwan.gautron@yahoo.fr>
> ??? Need raptor in staging for building rasqal, redland.
> ??? raptor, rasqal and redland are all parts of librdf.org??? (rasqal and redland packages intregration will come later)
> ??? 
> Signed-off-by: Erwan Gautron <erwan.gautron@yahoo.fr>
> ---
> ?package/raptor/raptor.mk | 2 +-
> ?1 file changed, 1 insertion(+), 1 deletion(-)

Applied to next, thanks. However, your patch was corrupted, so I had to
fix it up. Please use "git send-email" to send your next patches.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
