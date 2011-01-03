From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Jan 2011 09:08:53 +0100
Subject: [Buildroot] commiting patches
In-Reply-To: <8739pfhtgk.fsf@macbook.be.48ers.dk>
References: <20101230063005.15755osot9w5qwco@www.home.zuerker.org>
	<8739pfhtgk.fsf@macbook.be.48ers.dk>
Message-ID: <20110103090853.5168f221@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As this is my first message to the list in 2011: happy new year
everybody. Best wishes for 2011, and let's have some good BR
development during this year :-)

On Thu, 30 Dec 2010 21:54:51 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> I'm not following any strict procedure, but I do try to sooner or
> later get around to review all patches. Understand that I do this in
> my spare time, so turnaround time can sometimes be slow.
> 
> I mainly try to handle the patches in fifo mode, but I do also skim
> new mails. This is both because sometimes updates are sent, and
> sometimes I see trivial patches that can be handled when I have 5 min
> spare or important bugfixes.

I think there is also one criteria that has an impact of the time it
takes for a patch to be applied: what the patch does. If the patch is a
relatively simple fix to a package, a new package, or something that
doesn't have any major impact of Buildroot's infrastructure, or
Buildroot usage, then this patch is likely to be handled/merged sooner
than something that has broader impact.

For example, Heiko, your patch "Improved initramfs and iso target
support" will take quite a bit of time, because it changes quite a few
things, adds new use cases, we have to think whether we want to handle
those use cases, if they are handled the correct way, etc. Such patches
usually take a bit more time to handle than others.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
