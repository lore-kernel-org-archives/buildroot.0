From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 22:24:38 +1300
Subject: [Buildroot] [PATCH 1/1] pure-ftpd: Added pure-ftpd quotas
 config option
In-Reply-To: <1484765931-18410-1-git-send-email-bryce.ferguson@rockwellcollins.com>
References: <1484765931-18410-1-git-send-email-bryce.ferguson@rockwellcollins.com>
Message-ID: <20170124222438.60ad9aed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Jan 2017 12:58:51 -0600, Bryce Ferguson wrote:
> Added the pure-ftp quotas option.  When selected, the --with-quotas
> compiler option is passed which enables the quota feature
> 
> Note that this increases the size of the pure-ftpd executable by
> about 20%.
> 
> Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
> ---
>  package/pure-ftpd/Config.in    | 7 +++++++
>  package/pure-ftpd/pure-ftpd.mk | 4 ++++
>  2 files changed, 11 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
