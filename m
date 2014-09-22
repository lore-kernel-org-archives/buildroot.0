From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Sep 2014 19:25:03 +0200
Subject: [Buildroot] [PATCH 1/1] tiff: ensure directory exists before
 installing to it
In-Reply-To: <1410488467-2093-1-git-send-email-danomimanchego123@gmail.com>
References: <1410488467-2093-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20140922192503.23ee2050@free-electrons.com>
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

Could you explain which configuration produced an issue solved by this
patch? I tried a number of combinations (different toolchain
configurations, without C++, etc.) and I did not managed to produce the
issue.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
