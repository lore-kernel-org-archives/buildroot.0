From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 Jun 2021 23:36:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsoup: fix build with NLS
In-Reply-To: <20210609210448.1267475-1-fontaine.fabrice@gmail.com>
References: <20210609210448.1267475-1-fontaine.fabrice@gmail.com>
Message-ID: <20210609233616.4064c76c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  9 Jun 2021 23:04:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix build failure with NLS raised since bump to version 2.72.0 in commit
> 8e5f7f1cfc8fd7a9d5270f6a9707eb9eecfd21da
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1793753629d81476a3cd6fea40029cbd7de0206c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libsoup/libsoup.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
