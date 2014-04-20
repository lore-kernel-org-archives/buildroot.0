From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 23:04:14 +0200
Subject: [Buildroot] [PATCH 0/2] update sunxi-boards and sunxi-tools for
 pcDuino board
In-Reply-To: <1386721499.2817.17.camel@kokopelli>
References: <1386721499.2817.17.camel@kokopelli>
Message-ID: <20140420230414.5c69b8ec@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brian Beattie,

On Tue, 10 Dec 2013 16:24:59 -0800, Brian Beattie wrote:
> In preparation for adding support for for the pcduino board, update the
> sunxi-boards and sunxi-tools to the commit recommended for pcduino.
> 
> These packages are also used by the Cubieboard so if somebody with a
> Cubieboard could test this that would be good.
> 
> Brian Beattie (2):
>   update sunxi-boards to newer commit as recomended for pcDuino board
>   update sunxi-boards to newer commit as recomended for pcDuino board

I've applied your two patches. However, note that they were
line-wrapped, the title of the second patch was wrong (it was updating
the sunxi-tools package), and the commit logs were both lacking your
Signed-off-by line.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
