From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 21:36:54 +0100
Subject: [Buildroot] [PATCH] firejail: fix logic for comment
In-Reply-To: <20170309112529.52513-1-Vincent.Riera@imgtec.com>
References: <20170309112529.52513-1-Vincent.Riera@imgtec.com>
Message-ID: <20170309213654.3c32c9c7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 9 Mar 2017 11:25:29 +0000, Vicente Olivert Riera wrote:
> firejail depends on !uClibc, so the "firejail needs !uClibc" comment
> should be displayed when we do have uClibc. Right now the logic is just
> the other way around, so flip it.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/firejail/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Indeed, well spotted. Thanks for fixing this. Applied!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
