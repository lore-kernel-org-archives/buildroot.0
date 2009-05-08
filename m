From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 8 May 2009 00:22:39 -0300
Subject: [Buildroot] 2009.05-rc1: fix rsync build with config cache
In-Reply-To: <20090506122033.1c849569@bandomeer.europe.flane.local>
References: <20090506122033.1c849569@bandomeer.europe.flane.local>
Message-ID: <d6cda7730905072022o4b0780e5id8257de5a91b74e8@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, May 6, 2009 at 7:20 AM, Olaf Rempel <razzor@kopf-tisch.de> wrote:
> Hi,
>
> building rsync (x86 target) fails with config cache turned on
> (at least with my attached .config).
>

Also happens in avr32 with atngw100_defconfig

Signed-off-by: Thiago A. Correa <thiago.correa@gmail.com>

Kind Regards,
   Thiago A. Correa
