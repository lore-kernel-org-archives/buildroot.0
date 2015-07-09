From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jul 2015 22:04:30 +0200
Subject: [Buildroot] [PATCH] openssl: security bump to version 1.0.2d
In-Reply-To: <1436467513-27739-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436467513-27739-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150709220430.416b8168@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  9 Jul 2015 15:45:13 -0300, Gustavo Zacarias wrote:
> Fixes CVE-2015-1793 - Alternative chains certificate forgery.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/openssl/openssl.hash | 6 ++----
>  package/openssl/openssl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 5 deletions(-)

Yet another OpenSSL update, they never stop! :-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
