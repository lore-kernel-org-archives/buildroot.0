From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Tue, 27 Apr 2010 17:06:32 +0200
Subject: [Buildroot] recompile a package
In-Reply-To: <g2y630286c71004270755l88f987a2m4c8cfca36665fe7c@mail.gmail.com>
References: <g2y630286c71004270755l88f987a2m4c8cfca36665fe7c@mail.gmail.com>
Message-ID: <s2s4d28d4b51004270806kdd653few57117babecbb719b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Go to output/build/qt-everywere-opensource-src-4.6.2

rm .stamp_configured .stamp_build .stamp_staging_installed
.stamp_target_installed

Then go back to buildroot directory, and rerun make.

--
Lionel Landwerlin

On Tue, Apr 27, 2010 at 4:55 PM, Nataraj S Narayan <natarajsn@gmail.com> wrote:
> Hi
>
> I have changed the qt.mk.
>
> How do I recompile Qt package alone and merge with rootfs?
>
> Tried a "make clean" in
> output/build/qt-everywhere-opensource-src-4.6.2. But it don't rebuild.
>
>
> regards
>
> Nataraj
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
