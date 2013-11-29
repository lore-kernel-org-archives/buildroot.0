From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 29 Nov 2013 09:09:24 +0100
Subject: [Buildroot] [PATCH 2/5] package/rpi-firmware: add option to
	install firmware files in target/boot/
In-Reply-To: <1108197933.15379580.1385712019266.JavaMail.root@openwide.fr>
References: <1108197933.15379580.1385712019266.JavaMail.root@openwide.fr>
Message-ID: <201311290909.24184.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jeremy, All,

On Friday 29 November 2013 09:00:19 Jeremy Rosen wrote:
> If I may chip-in, I really like the logic of the proposed image builder...
> 
> Basically, you build the root filesystem the way it will look when all
> sub-filesystems are mounted, you describe how they are mounted and 
> the system builds the partitions accordingly.

Yes, that's exactly what I feel, too. When the image creation kicks in, the
filesystem(s) content is complete. I see 'genimages' like I look at genext2fs:
simply an image generator.

> I know that what I described is not exactly the logic behind the proposed
> patch, but it is a logic I like a lot because it is very easy to understand
> and explain. it could also allow us to automatically generate some fstab
> lines at some point, which could be nice.

And 'genimages' already does add the filesystems to the fstab. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
