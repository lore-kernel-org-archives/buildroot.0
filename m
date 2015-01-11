From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jan 2015 20:35:35 +0100
Subject: [Buildroot] [PATCH] openntpd: needs NPTL
In-Reply-To: <1420974602-24764-1-git-send-email-gustavo@zacarias.com.ar>
References: <1420974602-24764-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150111203535.02f6a6ee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 11 Jan 2015 08:10:02 -0300, Gustavo Zacarias wrote:
> Openntpd in fact needs nptl threads, basic threads aren't enough. Fixes:
> http://autobuild.buildroot.net/results/f4d/f4dd964231a5dbbc12a7237127fa9c45d6aa0d06/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/openntpd/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
