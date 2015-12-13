From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 14:12:25 +0100
Subject: [Buildroot] [PATCH 2/2] package/wireshark: libpcap is an
 optional dependency
In-Reply-To: <1449998185-15082-2-git-send-email-bernd.kuhls@t-online.de>
References: <1449998185-15082-1-git-send-email-bernd.kuhls@t-online.de>
 <1449998185-15082-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151213141225.3443276d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 13 Dec 2015 10:16:25 +0100, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/wireshark/Config.in    |  1 -
>  package/wireshark/wireshark.mk | 14 ++++++++++----
>  2 files changed, 10 insertions(+), 5 deletions(-)

I agree with Gustavo on this one, wireshark with libpcap is not very
useful, so I don't think it's a good idea to make this an optional
dependency.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
