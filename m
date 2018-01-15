From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jan 2018 21:35:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-mwclient: bump version
 to 0.8.7
In-Reply-To: <20180114181827.13854-1-bernd.kuhls@t-online.de>
References: <20180114181827.13854-1-bernd.kuhls@t-online.de>
Message-ID: <20180115213508.07a71341@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 14 Jan 2018 19:18:27 +0100, Bernd Kuhls wrote:
> Removed patch applied upstream:
> https://github.com/mwclient/mwclient/commit/60d4b933184172b98e4b31b79b4420c35571bbea
> 
> Added license hash.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...require-pytest-runner-only-when-necessary.patch | 43 ----------------------
>  package/python-mwclient/python-mwclient.hash       |  5 ++-
>  package/python-mwclient/python-mwclient.mk         |  4 +-
>  3 files changed, 5 insertions(+), 47 deletions(-)
>  delete mode 100644 package/python-mwclient/0001-setup.py-require-pytest-runner-only-when-necessary.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
