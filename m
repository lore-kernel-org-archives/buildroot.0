From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Sep 2015 10:15:52 +0200
Subject: [Buildroot] [PATCH v2] Revert "setools: fix race condition"
In-Reply-To: <1443599196-1073-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1443599196-1073-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150930101552.3fe53a41@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 30 Sep 2015 08:46:35 +0100, Vicente Olivert Riera wrote:
> This reverts commit 1ac68fe2c9b4cea91c7a30429ebf75279ede8e70.
> 
> Further investigations revealed that the problem wasn't a race condition
> but the lack of flex package in the host machine:
> 
>   https://github.com/TresysTechnology/setools3/issues/5#issuecomment-144048612
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v1 -> v2:
>   - Added missing SoB. (Highlighted by Thomas Petazzoni)

Both patches applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
