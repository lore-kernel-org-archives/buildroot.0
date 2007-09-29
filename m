From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 29 Sep 2007 16:05:37 +0200
Subject: [Buildroot] Quotes needed in package/Makefile.in
In-Reply-To: <46FE68B8.8000709@promwad.com>
References: <bcba51a0709282048v34a4ce24y4a984468955d54cb@mail.gmail.com>
	<20070929100540.GK20951@aon.at> <46FE467B.9040804@promwad.com>
	<20070929135302.GM20951@aon.at> <46FE68B8.8000709@promwad.com>
Message-ID: <20070929140537.GN20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 29, 2007 at 06:01:12PM +0300, Ivan Kuten wrote:
>Bernhard Fischer ??????????:

>> Do you have
>> /opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-strip ?
>
>Yes,
>ls -l /opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-strip
>-rwxr-xr-x  2 root root 2643719 Sep 29 14:35 /opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-strip
>
>But that problem is that "/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-strip --remove-section=.comment --remove-section=.note"
>trying to execute by shell as a single binary and not as arm-linux-uclibc-strip with parameters.

Please try the attached patchlet.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br2.flags-quote.00.diff
Type: text/x-diff
Size: 4142 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070929/5cb7822d/attachment.bin 
