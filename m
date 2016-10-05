From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 22:54:46 +0200
Subject: [Buildroot] [PATCH] wireshark: security bump to version 2.2.1
In-Reply-To: <1475662476-12335-1-git-send-email-gustavo@zacarias.com.ar>
References: <1475662476-12335-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20161005225446.0b18bbc9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Oct 2016 07:14:36 -0300, Gustavo Zacarias wrote:
> Fixes:
> wnpa-sec-2016-56 - The Bluetooth L2CAP dissector could crash.
> wnpa-sec-2016-57 - The NCP dissector could crash.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/wireshark/wireshark.hash | 4 ++--
>  package/wireshark/wireshark.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
