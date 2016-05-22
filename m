From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 May 2016 23:06:58 +0200
Subject: [Buildroot] [PATCH] expat: add fix for CVE-2016-0718
In-Reply-To: <1463661234-4110-1-git-send-email-gustavo@zacarias.com.ar>
References: <1463661234-4110-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160522230658.2dc002c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 May 2016 09:33:54 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2016-0718 - The Expat XML parser mishandles certain kinds of
> malformed input documents, resulting in buffer overflows during
> processing and error reporting. The overflows can manifest as a
> segmentation fault or as memory corruption during a parse operation. The
> bugs allow for a denial of service attack in many applications by an
> unauthenticated attacker, and could conceivably result in remote code
> execution.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/expat/0001-fix-CVE-2016-0718.patch | 757 +++++++++++++++++++++++++++++
>  1 file changed, 757 insertions(+)
>  create mode 100644 package/expat/0001-fix-CVE-2016-0718.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
