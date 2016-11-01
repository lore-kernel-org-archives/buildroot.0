From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 15:26:49 +0100
Subject: [Buildroot] [PATCH v3 4/9] lttng-tools: remove dependency on
 host-lttng-babeltrace
In-Reply-To: <20161031074624.7576-5-eeppeliteloop@gmail.com>
References: <20161031074624.7576-1-eeppeliteloop@gmail.com>
 <20161031074624.7576-5-eeppeliteloop@gmail.com>
Message-ID: <20161101152649.7bf5d4be@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 31 Oct 2016 03:46:19 -0400, Philippe Proulx wrote:
> We don't need to build Babeltrace for the host here. Any host running
> a major Linux distribution can get a recent version of Babeltrace.
> 
> See <http://diamon.org/babeltrace/>.
> 
> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes v2 -> v3:
>   - Nothing changed.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
