From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 19:06:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/nodejs: security bump to
 version 0.10.33
In-Reply-To: <1414660025-16954-1-git-send-email-jkrause@posteo.de>
References: <1414660025-16954-1-git-send-email-jkrause@posteo.de>
Message-ID: <20141030190621.316f91ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Thu, 30 Oct 2014 10:07:05 +0100, J?rg Krause wrote:
> This release handles the recent POODLE vulnerability [CVE-2014-3566] by
> disabling SSLv2/SSLv3 by default.
> 
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ---
>  package/nodejs/nodejs.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
