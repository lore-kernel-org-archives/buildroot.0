From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Feb 2015 22:22:18 +0100
Subject: [Buildroot] [PATCH 46/51] neardal: bump version
In-Reply-To: <1414349157-22749-46-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1414349157-22749-46-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150201222218.1ea28455@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 26 Oct 2014 19:45:52 +0100, Maxime Hadjinlian wrote:
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/neardal/neardal.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks. However, you did not test really properly your patch:
neardal now needs either libedit or readline, as mandatory dependency.
So I've fixed this before applying.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
