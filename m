From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 May 2016 15:55:02 +0200
Subject: [Buildroot] [PATCH] libksba: security bump to version 1.3.4
In-Reply-To: <1462885297-9450-1-git-send-email-gustavo@zacarias.com.ar>
References: <1462885297-9450-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160510155502.1474a247@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 May 2016 10:01:37 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2016-4356 - Fix encoding of invalid utf-8 strings in
> dn.c" and "read access out of bounds".
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libksba/libksba.hash | 2 +-
>  package/libksba/libksba.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
