From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 20:07:42 +0200
Subject: [Buildroot] [PATCH] package/python: fix sqlite3 extension
 without threads
In-Reply-To: <20140715172400.GC3351@free.fr>
References: <1405167112-9063-1-git-send-email-yann.morin.1998@free.fr>
 <20140715191811.487b84ac@free-electrons.com>
 <20140715172400.GC3351@free.fr>
Message-ID: <20140715200742.3a16d9e6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 15 Jul 2014 19:24:01 +0200, Yann E. MORIN wrote:

> > Applied, thanks. Do you know if Python 3 is affected as well?
> 
> It is not. The cset I backported is from 3.3, and we're using 3.4.1:
>     http://hg.python.org/cpython/file/v3.4.1/Modules/_sqlite/connection.c#l760

Excellent, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
