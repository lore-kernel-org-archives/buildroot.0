From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 14 Jan 2009 22:14:51 +0100
Subject: [Buildroot] error building alsa-utils
In-Reply-To: <496E4A36.4050902@carallon.com> (Will Wagner's message of "Wed\,
	14 Jan 2009 20\:25\:26 +0000")
References: <496E4A36.4050902@carallon.com>
Message-ID: <8763khbnec.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

 Will> Hi All,

 Will> I have just checked out the trunk and am doing an ARM build
 Will> with alsa-utils.

 Will> Have run into a couple of problems. The first is that it does
 Will> not compile with SUSV3_LEGACY disabled due to the use of index
 Will> & rindex. Have a patch that fixes that.

Ah yes, thats fairly common. Please send the patch to the list and
I'll apply it - Also don't forget to send it to the alsa people!

 Will> The second problem I have is it appears to be trying to install
 Will> the manual pages and is failing when trying to use xmlto
 Will> command. I want to configure it to not build/install the man
 Will> pages but I can't spot a configure option to do so. Am I
 Will> missing something obvious? If not how do you suggest fixing
 Will> this?

Well, if everything else fails, you can always patch the
Makefile.in's.

-- 
Bye, Peter Korsgaard
