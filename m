From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Nov 2016 10:23:54 +0100
Subject: [Buildroot] warp7_defconfig build error
In-Reply-To: <CAOMZO5BqVbb8PUQvFcwLB2Dnc2jRD_h0gtPY3Yc2CSywi-rsyw@mail.gmail.com>
References: <CAOMZO5CjVc=qA2u95KydQrLkkjTUZUdB8t+v_QdX-NViRJs4LQ@mail.gmail.com>
 <b6863c63-d744-1e73-20b0-c895d9e74012@mind.be>
 <CAOMZO5BqVbb8PUQvFcwLB2Dnc2jRD_h0gtPY3Yc2CSywi-rsyw@mail.gmail.com>
Message-ID: <20161105092354.GB3743@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-11-04 21:47 -0200, Fabio Estevam spake thusly:
> On Fri, Nov 4, 2016 at 9:20 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> >  I only get this error when makedevs is run for the second time, i.e. when
> > building the tarball, not the ext2. But perhaps you took this log by re-running
> > the build?
> The error happens for me even if I start a fresh build:
> make clean
> make warp7_defconfig
> make

Yep, I could reproduce as well.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
