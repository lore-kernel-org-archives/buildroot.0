From: Bernhard Fischer <rep.nop@aon.at>
Date: Fri, 1 Dec 2006 18:57:56 +0100
Subject: [Buildroot] update to udev-100
In-Reply-To: <20061201175030.GB27853@aon.at>
References: <20061129185944.32BC84858D@busybox.net>
	<20061129213847.GC15202@ibawizard.net>
	<20061201175030.GB27853@aon.at>
Message-ID: <20061201175756.GC27853@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 01, 2006 at 06:50:30PM +0100, Bernhard Fischer wrote:
>On Wed, Nov 29, 2006 at 10:38:47PM +0100, Petr Stetiar wrote:
>>aldot at uclibc.org <aldot@uclibc.org> [2006-11-29 10:59:44]:
>>
>>> Author: aldot
>>> Date: 2006-11-29 10:59:43 -0800 (Wed, 29 Nov 2006)
>>> New Revision: 16723
>>> 
>>> Log:
>>> - build a udev for the target rather than for the host.
>>
>>Attached patch bumps version to 100, fixes Makefile and init script.
>
>I use busybox's mdev if i need someone to mknod under me, but ok.

Applied as r16746.
thanks,

PS: looking for the udev update bugs in the bug collector to clean 'em
out now..
