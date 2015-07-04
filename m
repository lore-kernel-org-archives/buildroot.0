From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 14:37:32 +0200
Subject: [Buildroot] [PATCH v2 1/2] ltrace: update to current master
In-Reply-To: <1435921524-31825-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1435921524-31825-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150704143732.296a3e64@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 3 Jul 2015 13:05:23 +0200, Vicente Olivert Riera wrote:
> Lots of fixes have been made to ltrace, including the ones for fixing a
> build failure for MIPS architecture. Updating to current master will
> allow us to re-enable this package for MIPS and also remove some
> upstreamed patches.
> 
> At the same time we add a patch made by J?r?me Pouiller to fix a bug
> introduced by 5ba9e10 ("Split type definitions from the bundled configs
> into their own files"). Two new configuration files are not installed.
> Therefore, ltrace fail with messages like :
> 
> /usr/share/ltrace/libm.so.conf:333: error: unknown type around 'ldouble
> erfl(ldouble);
> 
> That patch has been sent upstream.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> v1 -> v2: add J?r?me Pouiller's patch

Both applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
