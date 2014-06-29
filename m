From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 12:43:48 +0200
Subject: [Buildroot] [PATCH 2/2] devmem2: fix output when
 _FILE_OFFSET_BITS=64
In-Reply-To: <1403194417-19986-2-git-send-email-maxime.hadjinlian@gmail.com>
References: <1403194417-19986-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1403194417-19986-2-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140629124348.56fc4864@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Thu, 19 Jun 2014 18:13:37 +0200, Maxime Hadjinlian wrote:
> From: Colin Didier <colin.didier@devialet.com>
> 
> When built with _FILE_OFFSET_BITS=64, off_t becomes an long long int
> and was printed as an unsigned int which lead to a garbled output.
> 
> Signed-off-by: Colin Didier <colin.didier@devialet.com>
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@devialet.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
