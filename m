From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 17:23:05 +0100
Subject: [Buildroot] [PATCH 3/4] torsmo: add a hash file
In-Reply-To: <1449059383-62131-3-git-send-email-Vincent.Riera@imgtec.com>
References: <1449059383-62131-1-git-send-email-Vincent.Riera@imgtec.com>
 <1449059383-62131-3-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151217172305.7636801d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 2 Dec 2015 12:29:42 +0000, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/torsmo/torsmo.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/torsmo/torsmo.hash

Applied, thanks. However, I think you could send a patch to deprecate
this package. It is really not something that is maintained or
evolving, it doesn't have a website or anything. It's really a leftover
from the time where we had some avr32 support contributed by Atmel and
other folks.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
