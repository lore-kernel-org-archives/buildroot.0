From: Cameron Hutchison <lists@xdna.net>
Date: Sun, 02 May 2010 23:55:49 -0000
Subject: [Buildroot] Building libglib2 on 2009.11 with ext-toolchain
References: <699c.4bd65f15.82e9a@getafix.xdna.net>
	<s2w4d28d4b51004270047p7a26c0b2of2866d675e86bd02@mail.gmail.com>
Message-ID: <7d8f.4bde1105.1f181@getafix.xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lionel Landwerlin <llandwerlin@gmail.com> writes:
>On Tue, Apr 27, 2010 at 5:50 AM, Cameron Hutchison <lists@xdna.net> wrote:
>> I am trying to build libglib2 using buildroot 2009.11 using an external
>> toolchain. I am hitting the problem described here:
>>
>> http://lists.busybox.net/pipermail/buildroot/2010-February/031955.html
>>
>> In a message in that thread, Thomas Petazzoni said:
>>
>> ?For the record, I've been able to fix this issue by using a more recent
>> ?gtk-doc.m4 version than the one I had in my repo. So now, libglib2
>> ?build with LIBTOOL_PATCH=YES and AUTORECONF=YES works.
>>
>> Can someone tell me where gtk-doc.m4 comes from and how I update it?
>
>It's coming from here :
>http://git.buildroot.org/buildroot/tree/package/automake/gtk-doc.m4

Thanks Lionel.

Just for the record, I also needed to apply the patch from
https://bugzilla.gnome.org/show_bug.cgi?id=591840

to generate a working configure script.
