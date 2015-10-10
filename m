From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Oct 2015 19:36:57 +0200
Subject: [Buildroot] [PATCH 1/3] proftpd: Add ftp user creation
In-Reply-To: <1443965495-12774-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443965495-12774-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20151010193657.444136f4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun,  4 Oct 2015 15:31:33 +0200, Maxime Hadjinlian wrote:
> In order to remove '/home/ftp' and the ftp user from the 'skeleton'
> package, we need to add the creation of the ftp users to the package so
> it still work out of the box (with an anonymous user).
> 
> Signed-off-by Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/proftpd/proftpd.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
