From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 23:30:19 +0100
Subject: [Buildroot] [PATCH 2/5] test-pkg: filter empty lines and
 comments in CSV file
In-Reply-To: <20171029171440.8095-3-thomas.petazzoni@free-electrons.com>
References: <20171029171440.8095-1-thomas.petazzoni@free-electrons.com>
 <20171029171440.8095-3-thomas.petazzoni@free-electrons.com>
Message-ID: <20171127233019.3929fef9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Oct 2017 18:14:37 +0100, Thomas Petazzoni wrote:
> In preparation for the addition of comments in the CSV file listing
> toolchain configurations, we filter out such lines when reading the
> CSV file in utils/test-pkg.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  utils/test-pkg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
