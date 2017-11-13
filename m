From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Mon, 13 Nov 2017 13:51:01 +0100
Subject: [Buildroot] [PATCH/next 4/5] solidrun/macchiatobin: add new
 board
In-Reply-To: <20171113122702.o63kfb7j4iny6sfl@sapphire.tkos.co.il>
References: <20171112201646.15558-1-geomatsi@gmail.com>
 <20171112201646.15558-5-geomatsi@gmail.com>
 <20171113122702.o63kfb7j4iny6sfl@sapphire.tkos.co.il>
Message-ID: <3065e82a-8fd5-422c-8734-2fa4257bdc8d@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On pond?l? 13. listopadu 2017 13:27:02 CET, Baruch Siach wrote:
> Create a uEnv.txt file, and store it in /boot.

Hi Baruch, does U-Boot auto-load this file on each and every boot? If not, 
than I suggest to name it differently -- perhaps uEnv-recovery.txt. I would 
expect that any change in a /boot/uEnv.txt somehow propagates to U-Boot 
environment during the next boot.

Cheers,
Jan
