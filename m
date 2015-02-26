From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Feb 2015 11:08:58 +0100
Subject: [Buildroot] [PATCH 00/13] autobuild-run: python3 compat and
 misc improvements
In-Reply-To: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
References: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
Message-ID: <20150226110858.183d31f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Erdmann,

On Wed, 25 Feb 2015 22:17:17 +0100, Andr? Erdmann wrote:
> Patches 1-4 make autobuild-run compatible with both python >=2.6 and 3.
> 
> Patches 5-9 are minor enhancements (mostly cleanup).
> 
> Patches 10- are more invasive:
> * move the check_requirements() logic to the SystemInfo class
> * control environment(->locale), std{in,out,err} of all called commands

Thanks a lot all those patches. Overall they look very useful!

I really need to spend some time to merge the patches proposed by
Thomas DS, and then your patches. I would still like to give the
priority to Thomas DS patches, since they have been in the queue for a
very long time.

Again, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
