From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 20:00:03 +0100
Subject: [Buildroot] [PATCH v2] strongswan: unavailable for static builds
In-Reply-To: <1454333927-16439-1-git-send-email-gustavo@zacarias.com.ar>
References: <1454333927-16439-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160201200003.3615c3cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon,  1 Feb 2016 10:38:47 -0300, Gustavo Zacarias wrote:
> Uses dlopen in plugin_loader (not optional), fixes:
> http://autobuild.buildroot.net/results/601/601d8dc1654d8733db49b195139e12437663034c/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
> v2: rebase on master

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
