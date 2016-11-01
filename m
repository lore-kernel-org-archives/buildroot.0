From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 15:25:54 +0100
Subject: [Buildroot] [PATCH v3 2/9] lttng-libust: enable Python agent
 when Python is available
In-Reply-To: <20161031074624.7576-3-eeppeliteloop@gmail.com>
References: <20161031074624.7576-1-eeppeliteloop@gmail.com>
 <20161031074624.7576-3-eeppeliteloop@gmail.com>
Message-ID: <20161101152554.11eb2230@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 31 Oct 2016 03:46:17 -0400, Philippe Proulx wrote:
> Add the --enable-python-agent configure option to build the LTTng-UST
> Python agent when Python 2 or Python 3 is also part of the BR image. The
> LTTng-UST Python agent is a Python package which adds LTTng tracing to
> Python's standard logging when imported.
> 
> Disable the Python agent otherwise.
> 
> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
> ---
> This is a new patch in v3.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
