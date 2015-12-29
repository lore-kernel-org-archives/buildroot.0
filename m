From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 18:06:34 +0100
Subject: [Buildroot] [PATCH 1/1] This commit adds the readme.txt to the
 the Orange Pi PC board configuration.
In-Reply-To: <1451390020-3145-1-git-send-email-echaudron@xiot.nl>
References: <1451390020-3145-1-git-send-email-echaudron@xiot.nl>
Message-ID: <20151229180634.0a0b694d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eelco Chaudron,

On Tue, 29 Dec 2015 12:53:40 +0100, Eelco Chaudron wrote:
> Signed-off-by: Eelco Chaudron <echaudron@xiot.nl>
> ---
>  board/orangepi/orangepipc/readme.txt | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 board/orangepi/orangepipc/readme.txt

Thanks, I've applied your patch with a few minor tweaks. The main tweak
is that your commit title was not appropriate. A commit title should be
short (< 80 characters), not be a sentence, and must start with a
"category". So I've changed it to:

	configs: add readme.txt for the orangepipc defconfig

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
