From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 May 2017 23:18:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/hwloc: install package to
 staging directory
In-Reply-To: <1496167463-10721-1-git-send-email-gmh7@sfu.ca>
References: <1496167463-10721-1-git-send-email-gmh7@sfu.ca>
Message-ID: <20170530231838.369fc7ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 May 2017 11:04:23 -0700, Graham Holland wrote:
> The hwloc package consists of a library and utilities so it should be installed
> to both the staging and target directories.
> 
> Signed-off-by: Graham Holland <gmh7@sfu.ca>
> ---
>  package/hwloc/hwloc.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
