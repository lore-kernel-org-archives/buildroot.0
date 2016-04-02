From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Apr 2016 16:51:38 +0200
Subject: [Buildroot] [PATCH] php: security bump to version 5.6.20
In-Reply-To: <1459512139-29247-1-git-send-email-gustavo@zacarias.com.ar>
References: <1459512139-29247-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160402165138.446ba5a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Apr 2016 09:02:19 -0300, Gustavo Zacarias wrote:
> Fixes (no CVEs yet):
> Buffer over-write in finfo_open with malformed magic file.
> Invalid memory write in phar on filename with \0 in name.
> Parsing of tar file with duplicate filenames causes memory leak.
> php_snmp_error() Format String Vulnerability.
> Integer Overflow in php_raw_url_encode.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
