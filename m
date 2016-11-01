From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 15:25:50 +0100
Subject: [Buildroot] [PATCH v3 1/9] lttng-libust: bump to version 2.8.1
In-Reply-To: <20161031074624.7576-2-eeppeliteloop@gmail.com>
References: <20161031074624.7576-1-eeppeliteloop@gmail.com>
 <20161031074624.7576-2-eeppeliteloop@gmail.com>
Message-ID: <20161101152550.2cd46e7c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 31 Oct 2016 03:46:16 -0400, Philippe Proulx wrote:
> The two current patches are removed because they were merged upstream.
> 
> The new patch is needed to build with uClibc. It was also submitted
> upstream, but not merged as is yet. Defining NT_GNU_BUILD_ID to 3 when
> it's not defined seems like it's something done in other projects. This
> definition's value should never change (number of the build ID note
> section in ELF objects).
> 
> LTTng-UST now has its man pages written in AsciiDoc and they get
> converted to troff at build time. This is not needed in a Buildroot
> image anyway.
> 
> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
> ---
> Changes v2 -> v3:
>   - Add link to original patch in patch file.
>   - Move Python agent stuff to another patch.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
