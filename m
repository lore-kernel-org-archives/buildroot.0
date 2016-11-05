From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 13:17:42 +0100
Subject: [Buildroot] [PATCH] tinyalsa: avoid install in /usr/local/
In-Reply-To: <20161104152842.24174-1-maxime.hadjinlian@gmail.com>
References: <20161104152842.24174-1-maxime.hadjinlian@gmail.com>
Message-ID: <20161105131742.20b7b42e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  4 Nov 2016 16:28:42 +0100, Maxime Hadjinlian wrote:
> Set the PREFIX to avoid installing files in [...]/usr/local/.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/tinyalsa/tinyalsa.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
