From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Dec 2014 11:41:44 +0100
Subject: [Buildroot] [PATCH 1/3] ntp: security bump to version 4.2.8
In-Reply-To: <1419258421-18318-1-git-send-email-gustavo@zacarias.com.ar>
References: <1419258421-18318-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141223114144.7ab5e4d3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 22 Dec 2014 11:26:59 -0300, Gustavo Zacarias wrote:
> Fixes:
> 
> CVE-2014-9293 - ntpd generated a weak key for its internal use, with
> full administrative privileges.  Attackers could use this key to
> reconfigure ntpd (or to exploit other vulnerabilities).
> 
> CVE-2014-9294 - The ntp-keygen utility generated weak MD5 keys with
> insufficient entropy.
> 
> CVE-2014-9295 - ntpd had several buffer overflows (both on the stack and
> in the data section), allowing remote authenticated attackers to crash
> ntpd or potentially execute arbitrary code.
> 
> CVE-2014-9296 - The general packet processing function in ntpd did not
> handle an error case correctly.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

All three patches applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
