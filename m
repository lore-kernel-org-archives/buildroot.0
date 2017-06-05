From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 11:18:29 +0200
Subject: [Buildroot] [PATCH] systemd: add upstream security fix
In-Reply-To: <d116b87e5aea0bf5820ba5af0e048f89fafa4ee8.1496600674.git.baruch@tkos.co.il>
References: <d116b87e5aea0bf5820ba5af0e048f89fafa4ee8.1496600674.git.baruch@tkos.co.il>
Message-ID: <20170605111829.2c0942b4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Jun 2017 21:24:34 +0300, Baruch Siach wrote:
> Fixes CVE-2017-9217: remote DoS (daemon crash) via a crafted DNS response with
> an empty question section.
> 
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/systemd/systemd.hash | 1 +
>  package/systemd/systemd.mk   | 3 +++
>  2 files changed, 4 insertions(+)

Applied to master, thanks. Peter: I guess this should go to the LTS
branch. Baruch, can you confirm it applies to the systemd version we
have in the LTS branch?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
