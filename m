From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Oct 2016 17:16:39 +0100
Subject: [Buildroot] [PATCH 3/5] lttng-tools: remove dependency on
 host-lttng-babeltrace
In-Reply-To: <20161029180339.24535-4-eeppeliteloop@gmail.com>
References: <20161029180339.24535-1-eeppeliteloop@gmail.com>
 <20161029180339.24535-4-eeppeliteloop@gmail.com>
Message-ID: <20161030171639.0fafb3a5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Oct 2016 14:03:37 -0400, Philippe Proulx wrote:
> We don't need to build Babeltrace for the host here. Any host running
> a major Linux distribution can get a recent version of Babeltrace.
> 
> See <http://diamon.org/babeltrace/>.
> 
> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>

This one looks good to me, but please include it again in your v2 of
this series, with a:

   Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
