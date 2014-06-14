From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 19:06:16 +0200
Subject: [Buildroot] [PATCH] libdrm: Add menu option to install the test
 programs
In-Reply-To: <1400857999-17449-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1400857999-17449-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <20140614190616.00306b18@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Fri, 23 May 2014 12:13:19 -0300, Ezequiel Garcia wrote:
> The libdrm has a bunch of useful test programs. Add an option to pass
> the configure option to install them.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  package/libdrm/Config.in | 5 +++++
>  package/libdrm/libdrm.mk | 4 ++++
>  2 files changed, 9 insertions(+)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
