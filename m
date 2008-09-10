From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 10 Sep 2008 21:03:10 +1000
Subject: [Buildroot] [PATCH] Option to disable cursor in X; retry
In-Reply-To: <20080910081259.GB24785@aeon.hgd.crondor.net>
References: <20080910081259.GB24785@aeon.hgd.crondor.net>
Message-ID: <20080910110310.GB18852@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 10, 2008 at 10:12:59AM +0200, Michel Wilson wrote:
> Adds an option to disable the root cursor in X. Ideal for display-only
> systems where a cursor only gets in the way. This is the
> non-line-wrapped version of the patch ;)

Does this disable the cursor completely, or add the ability to disable
it through an API or configuration item?

Because if it just plain disables the cursor that doesn't seem to be
appropriate for a compile time option. (Not that it's your fault of
course.)


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
