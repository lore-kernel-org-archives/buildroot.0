From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 30 Aug 2018 09:53:49 +0200
Subject: [Buildroot] [PATCH v2 1/5] toolchain/toolchain-wrapper: add
 link wrapper
In-Reply-To: <1535600085-31526-2-git-send-email-matthew.weber@rockwellcollins.com>
References: <1535600085-31526-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1535600085-31526-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180830095349.1247fe54@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

On Wed, 29 Aug 2018 22:34:41 -0500, Matt Weber wrote:
>  - Updates symlink creation int/ext toolchain
>  - Adds new source file for link wrapper with build/install
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

I think this commit log should contain a detailed explanation of why
wrapping the linker is necessary. Could you provide an example of a
package that absolutely needs the linker to be wrapped ? I'd like to do
a bit of testing, because I'm still not entirely convinced that we want
to wrap the linker. Perhaps we need to do this, but I'd like to spend a
bit of time looking at a specific example of a package that makes this
necessary. Could you provide such an example ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
