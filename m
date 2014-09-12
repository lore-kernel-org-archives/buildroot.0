From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Sep 2014 09:34:15 +0200
Subject: [Buildroot] [PATCH 1/1] tiff: ensure directory exists before
 installing to it
In-Reply-To: <1410488467-2093-1-git-send-email-danomimanchego123@gmail.com>
References: <1410488467-2093-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20140912093415.526e71a2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Thu, 11 Sep 2014 22:21:07 -0400, Danomi Manchego wrote:
> Also, don't ignore errors during installation.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/tiff/tiff.mk |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
