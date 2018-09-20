From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 23:38:52 +0200
Subject: [Buildroot] [PATCH 1/2] cppcms: fix license
In-Reply-To: <20180918213404.27239-1-fontaine.fabrice@gmail.com>
References: <20180918213404.27239-1-fontaine.fabrice@gmail.com>
Message-ID: <20180920233852.561b5004@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Sep 2018 23:34:03 +0200, Fabrice Fontaine wrote:
> cppcms contains embedded third party software so add
> THIRD_PARTY_SOFTWARE.TXT to CPPCMS_LICENSE_FILES as well as the
> additional licenses to CPPCMS_LICENSE.
> Also add hash for COPYING.TXT and THIRD_PARTY_SOFTWARE.TXT
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/cppcms/cppcms.hash | 2 ++
>  package/cppcms/cppcms.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
