From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 May 2016 18:02:42 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-05-13
In-Reply-To: <20160514145905.GA3877@free.fr>
References: <20160514063024.2C7B91025E9@stock.ovh.net>
 <20160514154655.57ae0bad@free-electrons.com>
 <20160514145905.GA3877@free.fr>
Message-ID: <20160514160242.GB3877@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-05-14 16:59 +0200, Yann E. MORIN spake thusly:
> On 2016-05-14 15:46 +0200, Thomas Petazzoni spake thusly:
> > >         i686 |             host-python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/e5b005a3ac9d7313b71eaf492d03d6b61b87e683/
> > 
> > /usr/bin/ld: BFD (GNU Binutils for Ubuntu) 2.24 internal error, aborting at ../../bfd/merge.c line 873 in _bfd_merged_section_offset
> > 
> > Yann, this is happening on your machine. Can you have a look, and see
> > if it's reproducible, or if it's a bug due a HW issue?
[--SNIP--]
> So it all looks to me like there is a parallel build issue.

I've just run this config on my autobuilder, and the build was fine
(twice in a row, once with the machine already loaded, once with the
machine otherwise idle).

I'll do a few such builds in loop, just to see if the issue is
reproducible.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
