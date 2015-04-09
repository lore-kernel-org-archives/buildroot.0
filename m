From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 23:33:53 +0200
Subject: [Buildroot] [PATCH] pciutils: cleanup
In-Reply-To: <1428614525-10984-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428614525-10984-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150409233353.40c17dd7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  9 Apr 2015 18:22:05 -0300, Gustavo Zacarias wrote:
> It makes no sense to have variables that are only used in one place
> (PCIUTILS_MAKE_OPTS) for different build conditions.
> Just make them add-up to MAKE_OPTS and move the fixed definition up.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/pciutils/pciutils.mk | 34 ++++++++++++++--------------------
>  1 file changed, 14 insertions(+), 20 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
