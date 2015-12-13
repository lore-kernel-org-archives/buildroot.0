From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 13 Dec 2015 07:48:47 -0300
Subject: [Buildroot] [PATCH 2/2] package/wireshark: libpcap is an
 optional dependency
In-Reply-To: <1449998185-15082-2-git-send-email-bernd.kuhls@t-online.de>
References: <1449998185-15082-1-git-send-email-bernd.kuhls@t-online.de>
 <1449998185-15082-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <566D4D0F.7030500@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/12/15 06:16, Bernd Kuhls wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>   package/wireshark/Config.in    |  1 -
>   package/wireshark/wireshark.mk | 14 ++++++++++----
>   2 files changed, 10 insertions(+), 5 deletions(-)

Hi.
I'm not so sure this is a good idea, capturing packets in wireshark is 
kind of an expected functionality, and wireshark itself is already big 
compared to libpcap (lots of dissectors and so on) so it's not like 
we're saving anything great here.
Regards.
