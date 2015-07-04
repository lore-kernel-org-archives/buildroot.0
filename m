From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 14:58:58 +0200
Subject: [Buildroot] [PATCH] polarssl: security bump to version 1.2.14
In-Reply-To: <1436013150-29494-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436013150-29494-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150704145858.00cbdb43@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat,  4 Jul 2015 09:32:30 -0300, Gustavo Zacarias wrote:
> Fixes one remotely-triggerable issue that was found by the Codenomicon
> Defensics tool, one potential remote crash and countermeasures against
> the "Lucky 13 strikes back" cache-based attack.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/polarssl/polarssl.hash | 4 ++--
>  package/polarssl/polarssl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
