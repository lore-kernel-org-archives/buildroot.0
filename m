From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 19:44:50 +0200
Subject: [Buildroot] [PATCH] get-developers: fix handling of syntax error
In-Reply-To: <20170701172950.6869-1-arnout@mind.be>
References: <20170701172950.6869-1-arnout@mind.be>
Message-ID: <20170701194450.14c6a4c9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 1 Jul 2017 19:29:50 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> When getdeveloperlib.parse_developers doesn't find anything, the script
> tries sys.exit(1) but sys is not imported.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  utils/get-developers | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
