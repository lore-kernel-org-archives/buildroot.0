From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Aug 2018 13:43:01 +0200
Subject: [Buildroot] [PATCH 6/6] libb64: Fix integer overflow and
 uninitialized C++ objects.
In-Reply-To: <20180823103930.5112-1-mikael@robomagi.com>
References: <20180823103930.5112-1-mikael@robomagi.com>
Message-ID: <20180823134301.3923e2b7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Aug 2018 12:39:30 +0200, Mikael Eliasson wrote:
> Signed-off-by: Mikael Eliasson <mikael@robomagi.com>

Thanks Mikael for this patch. First of all, why is it PATCH 6/6 ? We
did not receive anything else but this sixth patch. Did you had other
patches in your series, or is this a mistake ?

Also, could you provide some explanation in the commit log as to why we
want those fixes ? Are there fixing security issues ? Runtime bugs ? A
bit of context/explanation would be good to have.

Also, since libb64 is maintained with Git (git clone
https://git.code.sf.net/p/libb64/git libb64-git), could you use
Git-formatted patches, for both patches (and therefore have both of
them in package/, rather than download one from Debian, and have one in
package/) ?

Have these patches been submitted upstream ?

Thanks!

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
