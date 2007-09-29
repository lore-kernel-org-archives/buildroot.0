From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 29 Sep 2007 15:53:02 +0200
Subject: [Buildroot] Quotes needed in package/Makefile.in
In-Reply-To: <46FE467B.9040804@promwad.com>
References: <bcba51a0709282048v34a4ce24y4a984468955d54cb@mail.gmail.com>
	<20070929100540.GK20951@aon.at> <46FE467B.9040804@promwad.com>
Message-ID: <20070929135302.GM20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 29, 2007 at 03:35:07PM +0300, Ivan Kuten wrote:
>Bernhard Fischer ??????????:
>> On Fri, Sep 28, 2007 at 11:48:28PM -0400, Dimitry Golubovsky wrote:
>> 
>>> Please add quotes in package/Makefile.in, like this:
>> 
>> Yes, sorry. Fixed now.
>> _______________________________________________
>> buildroot mailing list
>> buildroot at uclibc.org
>> http://busybox.net/mailman/listinfo/buildroot
>
>Seems it's not final fix cause I get such error on some packeges such as dropbear, strace:
>
>make[1]: Leaving directory `/opt/buildroot/build_arm/strace-4.5.15'
>install -c /opt/buildroot/build_arm/strace-4.5.15/strace /opt/buildroot/project_build_arm/uclibc/root/usr/bin/strace
>"/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-strip --remove-section=.comment --remove-section=.note" /opt/buildroot/project_build_arm/uclibc/root/usr/bin/strace > /dev/null 2>&1
>make: *** [/opt/buildroot/project_build_arm/uclibc/root/usr/bin/strace] Error 127

Do you have
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-strip ?
