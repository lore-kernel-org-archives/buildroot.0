From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Aug 2014 22:14:51 +0200
Subject: [Buildroot] [PATCH] openssl: security bump to version 1.0.1i
In-Reply-To: <1407414643-11152-1-git-send-email-gustavo@zacarias.com.ar>
References: <1407414643-11152-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140807221451.1cc646e8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  7 Aug 2014 09:30:43 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2014-3508 - Information leak in pretty printing functions
> CVE-2014-5139 - Crash with SRP ciphersuite in Server Hello message
> CVE-2014-3509 - Race condition in ssl_parse_serverhello_tlsext
> CVE-2014-3505 - Double Free when processing DTLS packets
> CVE-2014-3506 - DTLS memory exhaustion
> CVE-2014-3507 - DTLS memory leak from zero-length fragments
> CVE-2014-3510 - OpenSSL DTLS anonymous EC(DH) denial of service
> CVE-2014-3511 - OpenSSL TLS protocol downgrade attack
> CVE-2014-3512 - SRP buffer overrun
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/openssl/openssl.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
