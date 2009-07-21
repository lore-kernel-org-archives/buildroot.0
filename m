From: Zac Wheeler <zac.wheeler@gmail.com>
Date: Tue, 21 Jul 2009 11:15:22 -0700
Subject: [Buildroot] clean build
In-Reply-To: <59693.172.16.221.250.1247692614.squirrel@cvs.xtale.biz>
References: <59693.172.16.221.250.1247692614.squirrel@cvs.xtale.biz>
Message-ID: <206b9e70907211115j3a90364bl1d1d8c960ba4cddf@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 15, 2009 at 2:16 PM, <nfrench@xtale.biz> wrote:

> What is the best way to do a clean build after changing an item in
> menuconfig it seems that a
> make clean followed by
> make
>
> does not rebuild everything ie if I have changed the compiler flags.
>
> if I do
>
> make distclean
>
> I have to do a make menuconfig before a make this also means that all the
> packages are dowloaded again.


I believe this is in the documentation, but if you create a directory in
buildroot called e.g. permanent_downloads and make dl/ a symoblic link to
that directory, you avoid having to re-download source packages.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090721/c6688aeb/attachment.htm>
