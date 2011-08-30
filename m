From: Michael S. Zick <minimod@morethan.org>
Date: Tue, 30 Aug 2011 05:45:57 -0500
Subject: [Buildroot] Linux kernel hangs after boot without any error!
In-Reply-To: <CADfuMF78u9we4HXSKZfnWYu4xwMX3vrKoVtbx+-c1L563KDOvw@mail.gmail.com>
References: <CADfuMF78u9we4HXSKZfnWYu4xwMX3vrKoVtbx+-c1L563KDOvw@mail.gmail.com>
Message-ID: <201108300545.59774.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu August 18 2011, Vasanth Ragavendran wrote:
> #
> # File systems
> #
> # CONFIG_EXT2_FS is not set
> 

That is the reason your kernel does not support ext2.

The reason your kernel appears to hang is most
likely answered in the FAQ link previously posted.

Mike
