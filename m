From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 22:48:45 +0200
Subject: [Buildroot] [PATCH v3 2/9] python: align the target finalize
 hooks with python3
In-Reply-To: <1462133720-409-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1462133720-409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1462133720-409-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160517224845.53cfc47f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 May 2016 22:15:13 +0200, Thomas Petazzoni wrote:
> Since the bump of python3 to 3.5.x, the target finalize hooks
> registered by the python3 have been changed a little bit. For the sake
> of consistency, this commit aligns the target finalize hooks
> registered by the python package so that they look the same as the
> ones used by python3.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/python/python.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
