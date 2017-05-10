From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 May 2017 23:34:15 +0200
Subject: [Buildroot] [PATCH master] mpir: fix build on MIPS R6 CPUs
In-Reply-To: <20170510105546.51108-1-Vincent.Riera@imgtec.com>
References: <20170510105546.51108-1-Vincent.Riera@imgtec.com>
Message-ID: <20170510233415.4906cef4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 May 2017 11:55:46 +0100, Vicente Olivert Riera wrote:
> Commit ef9eebf65f554d9aacfd420600c8ba17787151a8 tried to fix this
> problem in a wrong way. It was fixed only for generic R6 CPUs, so the
> problem still persist if you choose any other R6 CPU, like I6400 for
> instance.
> 
> Fix it properly by using the right kconfig options.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/f33/f33cb1e0b49fe8aee68fb4b66ea4c304b71a6f8f/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/mpir/mpir.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
