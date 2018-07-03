From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 3 Jul 2018 13:37:19 +0200
Subject: [Buildroot] [PATCH 01/50] package/busybox: backport upstream
 patch to fix install-noclobber
In-Reply-To: <20180703052548.iqefnv3kedkxuh3u@tarshish>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
 <2222ddf7fb0c17011ad26da66ff6fa5664f66240.1530565933.git.yann.morin.1998@free.fr>
 <20180703052548.iqefnv3kedkxuh3u@tarshish>
Message-ID: <20180703113719.GC2530@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2018-07-03 08:25 +0300, Baruch Siach spake thusly:
> On Mon, Jul 02, 2018 at 11:11:35PM +0200, Yann E. MORIN wrote:
> > Currently, we shoehorn the noclobber option with a sed call, but
> > upstream has applied a set of 4 patches that adds support to do
> > an install without clobbering.
> > 
> > Backport those patches, and use the new install rule.
> 
> Busybox 1.29.0 is out now. You can bump instead of backport.

OK, so it has been ~3 months I have been sitting ion this series waiting
for upstream to cut out a release. Seeing they were not, I decided to
refresh the series and send it.

And now, they reelases a new version right before I sent the series.
Dang... Muahaha! :-)

Thanks for the review, I'll update the series starting with a bump.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
