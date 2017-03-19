From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Mar 2017 14:51:18 +0100
Subject: [Buildroot] [PATCH v2 1/2] leptonica: new package
In-Reply-To: <1489910873-8450-2-git-send-email-gilles.talis@gmail.com>
References: <1489910873-8450-1-git-send-email-gilles.talis@gmail.com>
 <1489910873-8450-2-git-send-email-gilles.talis@gmail.com>
Message-ID: <20170319145118.39287c13@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Mar 2017 09:07:52 +0100, Gilles Talis wrote:
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> ---
> Changes v2 (following review by Thomas P.)
> - Fixed newline at end of hash file
> - Explicitly set autotools options using --with--XXX 
> - Added change in DEVELOPERS file
> ---
>  DEVELOPERS                       |  1 +
>  package/Config.in                |  1 +
>  package/leptonica/Config.in      |  8 +++++
>  package/leptonica/leptonica.hash |  2 ++
>  package/leptonica/leptonica.mk   | 64 ++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 76 insertions(+)
>  create mode 100644 package/leptonica/Config.in
>  create mode 100644 package/leptonica/leptonica.hash
>  create mode 100644 package/leptonica/leptonica.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
