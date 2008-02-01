From: tanweer alam <tanalam@gmail.com>
Date: Fri, 1 Feb 2008 19:05:04 +0530
Subject: [Buildroot] building xc-011010 against pango-1.13.5
Message-ID: <debbe8a90802010535x6a9590fdy6fa572a44a8fafe8@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
I am using buildroot release 20071120 for building toolchain and gtk+ with
tinyx for my arm platform.
Tinyx seems to compile ok .
but when it comes to compile pango I get undefined references as follows


/mnt/hda1/tanalam/Projects/tools/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.1/../../../../arm-linux-uclibc/bin/ld:
warning: libfreetype.so.7, needed by
/mnt/hda1/tanalam/Projects/tools/buildroot/build_arm/pango-1.13.5
/pango/.libs/libpangoft2-1.0.so, may conflict with libfreetype.so.6
./.libs/libpangoxft-1.0.so: undefined reference to
`XRenderFindStandardFormat'
./.libs/libpangoxft-1.0.so: undefined reference to `XftFontClose'
./.libs/libpangoxft-1.0.so: undefined reference to `XftTextExtents8'
./.libs/libpangoxft-1.0.so: undefined reference to `XftCharExists'
./.libs/libpangoxft-1.0.so: undefined reference to `XftLockFace'
./.libs/libpangoxft-1.0.so: undefined reference to
`XRenderCompositeTrapezoids'
./.libs/libpangoxft-1.0.so: undefined reference to `XftDrawPicture'
./.libs/libpangoxft-1.0.so: undefined reference to `XftCharIndex'
./.libs/libpangoxft-1.0.so: undefined reference to `XftDefaultHasRender'
./.libs/libpangoxft-1.0.so: undefined reference to `XftGlyphExtents'
./.libs/libpangoxft-1.0.so: undefined reference to `XftFontOpen'
./.libs/libpangoxft-1.0.so: undefined reference to `XftDefaultSubstitute'
./.libs/libpangoxft-1.0.so: undefined reference to `XftFontOpenPattern'
./.libs/libpangoxft-1.0.so: undefined reference to `XftDrawSrcPicture'
./.libs/libpangoxft-1.0.so: undefined reference to `XftGlyphSpecRender'
./.libs/libpangoxft-1.0.so: undefined reference to `XftDrawGlyphSpec'
./.libs/libpangoxft-1.0.so: undefined reference to `XftUnlockFace'


I searched the package of xc-011010 and found that some of the functions are
not even there.
Is there any compatilbility issue in builiding the two packages or am I
missing something.


Thanx and regards

Tanweer Alam
Cell phone: +91 9871208040


 / /  (_)__  __ ____  __
/ /__/ / _ \/ // /\ \/ /  . . .  t h e   c h o i c e   of a
/____/_/_//_/_,_/ /_/_\            G N U   g e n e r a t i o n.

A world without walls needs neither windows nor gates
****************************************************************
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080201/779af8b6/attachment-0001.htm 
