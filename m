From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 20:25:21 +0200
Subject: [Buildroot] [PATCH] python-pyzmq: enable PyZMQ for Python 3
In-Reply-To: <1405305317-11481-1-git-send-email-eeppeliteloop@gmail.com>
References: <1405305317-11481-1-git-send-email-eeppeliteloop@gmail.com>
Message-ID: <20140715202521.3e069edd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Philippe Proulx,

On Sun, 13 Jul 2014 22:35:17 -0400, Philippe Proulx wrote:
> The PyZMQ package is currently limited to Python 2; however, its
> build system does not require the Python 2 interpreter and will work
> as is with Python 3 (tested).
> 
> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
> ---
>  package/python-pyzmq/Config.in | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
