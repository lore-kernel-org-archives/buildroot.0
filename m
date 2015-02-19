From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 21:27:45 +0100
Subject: [Buildroot] [PATCH] php: security bump to version 5.5.22
In-Reply-To: <1424357996-11729-1-git-send-email-gustavo@zacarias.com.ar>
References: <1424357996-11729-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150219212745.0fa17e38@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 19 Feb 2015 11:59:56 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2015-0273 - Use after free vulnerability in unserialize() with
> DateTimeZone.
> CVE-2015-0235 - Mitigation for GHOST: glibc gethostbyname buffer
> overflow.
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
