From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 17:13:18 +0100
Subject: [Buildroot] [PATCH] package/leafnode2: fix news user check
In-Reply-To: <1419615491-8238-1-git-send-email-romain.naour@openwide.fr>
References: <1419615491-8238-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141227171318.42ba61a4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Fri, 26 Dec 2014 18:38:11 +0100, Romain Naour wrote:
> --enable-runas-user use 'news' as default but the configure stop
> if news doesn't exist on the build host.
> Use 'root' while cross-compiling
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/leafnode2/leafnode2.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Applied, thanks. Here, leafnode2 does not start properly at boot time,
it asks for a fully qualified host name in /etc/hosts. It would be good
to add a default config file + init script to make leafnode2 work at
least somewhat out of the box.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
