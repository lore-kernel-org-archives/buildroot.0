From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Mar 2018 23:38:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/e2fprogs
In-Reply-To: <trinity-2832c35e-305e-41ec-9b09-c7e93bf2833f-1519935172942@3c-app-gmx-bs41>
 (Jens Scheidemann's message of "Thu, 1 Mar 2018 21:12:52 +0100")
References: <trinity-2832c35e-305e-41ec-9b09-c7e93bf2833f-1519935172942@3c-app-gmx-bs41>
Message-ID: <87tvtze81a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jens" == Jens Scheidemann <nobodyman@gmx.de> writes:

 > # please add this patch to correct e2fsprogs

Why? Please add a sensible description to your patches, your
signed-off-by and use git send-email to send them as this is
linewrapped.

See the manual for more details:
https://buildroot.org/downloads/manual/manual.html#submitting-patches

> e2fsprogs.patch
 > --- package/e2fsprogs/e2fsprogs.mk.orig 2018-02-23 09:20:43.268166499
 > +0100
 > +++ package/e2fsprogs/e2fsprogs.mk 2018-02-23 09:21:10.020167273 +0100
 > @@ -30,7 +30,6 @@
 > --disable-defrag \
 > --disable-e2initrd-helper \
 > --disable-fuse2fs \
 > - --disable-libblkid \
 > --disable-libuuid \
 > --enable-symlink-install \
 > --disable-testio-debug
 > @@ -47,7 +46,6 @@
 > $(if $(BR2_PACKAGE_E2FSPROGS_FSCK),--enable-fsck,--disable-fsck) \
 > $(if $
 > (BR2_PACKAGE_E2FSPROGS_RESIZE2FS),--enable-resizer,--disable-resizer)
 > \
 > --disable-uuidd \
 > - --disable-libblkid \
 > --disable-libuuid \
 > --disable-e2initrd-helper \
 > --disable-testio-debug \

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
