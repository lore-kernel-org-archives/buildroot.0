From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 20:28:57 +0200
Subject: [Buildroot] [PATCH 1/1] bzip2: install shared library for the
 host
In-Reply-To: <1404993626-32112-1-git-send-email-david.bachelart@bbright.com>
References: <1404993626-32112-1-git-send-email-david.bachelart@bbright.com>
Message-ID: <20140715202857.20dbe624@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear David Bachelart,

On Thu, 10 Jul 2014 14:00:26 +0200, David Bachelart wrote:
> libbz2.so was explicitly built for the host, but was not installed. Install it.
> 
> Signed-off-by: David Bachelart <david.bachelart@bbright.com>
> ---
>  package/bzip2/bzip2.mk |    2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
