From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 16:57:24 +0100
Subject: [Buildroot] [PATCH 1/2 try 2] lcms2: Install into staging
In-Reply-To: <54A2FFA2.8010208@dawncrow.de>
References: <54A2FFA2.8010208@dawncrow.de>
Message-ID: <20150101165724.168088bb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Hentschel,

On Tue, 30 Dec 2014 20:40:18 +0100, Andr? Hentschel wrote:
> Other packages might depend on lcms2, thus it should install it's development files.
> I'm working on a clean Wine package and it wasn't able to find lcms2.
> 
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  package/lcms2/lcms2.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
