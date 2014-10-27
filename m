From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Oct 2014 17:47:48 +0100
Subject: [Buildroot] [PATCH 1/2] polarssl: security bump to version
 1.2.12
In-Reply-To: <1414418838-3487-1-git-send-email-gustavo@zacarias.com.ar>
References: <1414418838-3487-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141027174748.246048f8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 27 Oct 2014 11:07:17 -0300, Gustavo Zacarias wrote:
> Fixes several memory leaks.
> No assigned CVE or Polar-SA yet.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/polarssl/polarssl.hash | 5 ++---
>  package/polarssl/polarssl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 4 deletions(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
