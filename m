From: Jeff Krasky <jeff.krasky@dspcg.com>
Date: Mon, 28 Nov 2011 09:19:29 -0600
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <20111128161124.0f95d0d4@skate>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <20111122230429.2bef52c2@skate>
 <005d01cca963$b9a61eb0$0400a8c0@dspcgrnzks9p98>
 <20111122232914.76a86e7d@skate>
 <006101cca967$050bb240$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LVFSZpPxtsu9DmiEtw9LjNtdEWGQ+zdBQhscRAZ67vu_Q@mail.gmail.com>
 <001001ccaa28$4b7515c0$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LVDR+9KnTJP36-hugA51QTikDsQ2ESO4c3C9-L8UJgqBA@mail.gmail.com>
 <001e01ccaddf$81c0f300$0400a8c0@dspcgrnzks9p98>
 <20111128161124.0f95d0d4@skate>
Message-ID: <001f01ccade1$204918d0$0400a8c0@dspcgrnzks9p98>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > ETHERCAT_SITE = file:///home/user1/Desktop/EtherCAT4Atmel
> 
> This looks like a directory name and not a file.

My understanding from the tutorial at
http://buildroot.uclibc.org/buildroot.html#add_packages was that

ETHERCAT_SITE = file:///home/user1/Desktop/EtherCAT4Atmel

specifies the path (whether it is http or filesystem)

and

ETHERCAT_SOURCE = etherlabmaster.tar.bz2

specifies the file name.

Then I thought Buildroot would put ETHERCAT_SITE + ETHERCAT_SOURCE to come
up with the location of the file.  This is not correct?


I edited the .mk file to put the entire path in ETHERCAT_SITE, like

ETHERCAT_SITE = file:///home/user1/Desktop/EtherCAT4Atmel/
etherlabmaster.tar.bz2

but it still didn't find it.
