From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 22:35:54 +0100
Subject: [Buildroot] [PATCH] boost: bump to version 1.66.0
In-Reply-To: <20180109224601.29891-1-joerg.krause@embedded.rocks>
References: <20180109224601.29891-1-joerg.krause@embedded.rocks>
Message-ID: <20180112223554.3a4ccbb9@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Jan 2018 23:46:01 +0100, J?rg Krause wrote:
> Drop the metaparse module as it is header only library now. No need for
> legacy handling as the module is available unconditionally in Boost.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/boost/Config.in  | 8 --------
>  package/boost/boost.hash | 4 ++--
>  package/boost/boost.mk   | 3 +--
>  3 files changed, 3 insertions(+), 12 deletions(-)

Applied to master, thanks. Let's see how the autobuilders react to this
Boost update.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
