From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Jan 2013 10:13:38 +0100
Subject: [Buildroot] [RFC] How to handle targets that need more than one
	file system to boot?
In-Reply-To: <20130103095702.68dd064c@skate>
References: <201212240100.17473.yann.morin.1998@free.fr>
 <50E54714.8060602@mind.be> <20130103095702.68dd064c@skate>
Message-ID: <201301031013.38636.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Thursday 03 January 2013 09:57:02 Thomas Petazzoni wrote:
> On Thu, 03 Jan 2013 09:53:40 +0100, Arnout Vandecappelle wrote:
> 
> >   AFAIK there is no equivalent of genext2fs for FAT, so it would be 
> > rather difficult to make a boot-vfat.img in buildroot (use sudo?
> > fuse? pmount?).
> 
> You have the mtools, see http://www.gnu.org/software/mtools/.
> 
> Also, see the genimage tool from Pengutronix people:
> http://www.pengutronix.de/software/genimage/download/.

And genpart, too:
    http://www.pengutronix.de/software/genpart/index_en.html

Whoohoo! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
