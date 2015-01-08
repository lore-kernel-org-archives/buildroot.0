From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jan 2015 21:17:02 +0100
Subject: [Buildroot] [PATCH] openssl: security bump to version 1.0.1k
In-Reply-To: <1420744702-30123-1-git-send-email-gustavo@zacarias.com.ar>
References: <1420744702-30123-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150108211702.03205e1b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  8 Jan 2015 16:18:22 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2014-3571 - DTLS segmentation fault in dtls1_get_record
> CVE-2015-0206 - DTLS memory leak in dtls1_buffer_record
> CVE-2014-3569 - no-ssl3 configuration sets method to NULL
> CVE-2014-3572 - ECDHE silently downgrades to ECDH [Client]
> CVE-2015-0204 - RSA silently downgrades to EXPORT_RSA [Client]
> CVE-2015-0205 - DH client certificates accepted without verification
> [Server]
> CVE-2014-8275 - Certificate fingerprints can be modified
> CVE-2014-3570 - Bignum squaring may produce incorrect results
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
