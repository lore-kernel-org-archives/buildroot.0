From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Oct 2015 13:27:53 +0200
Subject: [Buildroot] [PATCH] wireshark: security bump to version 1.12.8
In-Reply-To: <1444907231-1923-1-git-send-email-gustavo@zacarias.com.ar>
References: <1444907231-1923-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151015132753.21c4d792@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 15 Oct 2015 08:07:11 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2015-7830 - Pcapng file parser crash.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/wireshark/wireshark.hash | 7 ++++---
>  package/wireshark/wireshark.mk   | 2 +-
>  2 files changed, 5 insertions(+), 4 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
