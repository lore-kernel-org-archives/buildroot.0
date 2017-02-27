From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Feb 2017 22:00:37 +0100
Subject: [Buildroot] [PATCH 1/1] Enable PAM functionality within systemd.
In-Reply-To: <1488164986-2871-1-git-send-email-james@balean.com.au>
References: <1488164986-2871-1-git-send-email-james@balean.com.au>
Message-ID: <20170227220037.54524a2b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Feb 2017 21:09:46 -0600, James Balean wrote:
> Enables systemd PAM support if BR2_PACKAGE_LINUX_PAM is set.
> Some essential config files are not installed without the --enable-pam option.
> 
> Signed-off-by: James Balean <james@balean.com.au>
> ---
>  package/systemd/systemd.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied to next, after tweaking a bit the commit title.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
