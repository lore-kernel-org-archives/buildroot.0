From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 19:47:15 +0100
Subject: [Buildroot] [PATCH 1/1] python-cheetah: fix python host
 dependency
In-Reply-To: <1426457392-22585-1-git-send-email-gwenj@trabucayre.com>
References: <1426457392-22585-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20150316194715.348e086d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On Sun, 15 Mar 2015 23:09:52 +0100, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> python-cheetah can't be used with python3. host-python-cheetah has the same
> limitation.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/python-cheetah/python-cheetah.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
