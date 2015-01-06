From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jan 2015 21:12:48 +0100
Subject: [Buildroot] [PATCH] imagemagick: security bump to version
 6.9.0-3
In-Reply-To: <1420565134-25535-1-git-send-email-gustavo@zacarias.com.ar>
References: <1420565134-25535-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150106211248.322f7b58@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue,  6 Jan 2015 14:25:34 -0300, Gustavo Zacarias wrote:
> Fixes many of the reported security audit vulnerabilities:
> http://www.openwall.com/lists/oss-security/2014/12/24/1
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/imagemagick/imagemagick.hash | 2 +-
>  package/imagemagick/imagemagick.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
