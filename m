From: Bernhard Fischer <rep.nop@aon.at>
Date: Tue, 10 Oct 2006 09:01:25 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
In-Reply-To: <200610092344.09722.rob@landley.net>
References: <20061009114134.C2C4E485D4@busybox.net>
	<20061009203437.GA26440@codepoet.org>
	<200610092146.51748.rob@landley.net>
	<200610092344.09722.rob@landley.net>
Message-ID: <20061010070125.GA13303@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 09, 2006 at 11:44:08PM -0400, Rob Landley wrote:
>On Monday 09 October 2006 9:46 pm, Rob Landley wrote:
>> On Monday 09 October 2006 4:34 pm, Erik Andersen wrote:
>> > On Mon Oct 09, 2006 at 11:33:06AM -0600, Erik wrote:
>> > > An alternative, is there are now some headers being
>> > > produced for all architectures by dwmw2:
>> > >     ftp://ftp.kernel.org/pub/linux/kernel/people/dwmw2/kernel-headers/
>> > > 
>> > > which looks to be usable for uClibc for all arches with minor tweeks.
>> > 
>> > Even better, it appears this is simply the result of
>> > running 'make headers_install_all' which is now present
>> > in 2.6.19-rc1.  So once 2.6.19 final is out, it will make
>> > generating kernel headers _MUCH_ easier for us,

headers_install_all does install all arch/*/ arch's headers which we
will most likely do not want to end up in the rootfs, no?

Let me point you to the log for belowmentioned ci.

>> At which point I stopped for dinner.  Just now getting back to it...
>
>Memo to self:  When installing the kernel headers, specify the %*#(&%& 

As stated earlier ;)
http://uclibc.org/lists/buildroot/2006-October/000273.html

cheers,
