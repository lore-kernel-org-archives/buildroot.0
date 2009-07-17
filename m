From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Date: Fri, 17 Jul 2009 15:37:40 -0300
Subject: [Buildroot] clean build
In-Reply-To: <59693.172.16.221.250.1247692614.squirrel@cvs.xtale.biz>
References: <59693.172.16.221.250.1247692614.squirrel@cvs.xtale.biz>
Message-ID: <81a4a26e0907171137j7b00c22aj172a76744699c150@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I just remove, in arm case, "build_arm", "project_build_arm" and
"toolchain_build_arm"

That gives me full build without downloading anything.

On Wed, Jul 15, 2009 at 6:16 PM, <nfrench@xtale.biz> wrote:

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
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090717/cf089c53/attachment-0001.htm>
