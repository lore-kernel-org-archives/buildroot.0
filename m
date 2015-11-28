From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Nov 2015 18:52:23 +0100
Subject: [Buildroot] [PATCH 1/1] dcron: startup fails with setpgid:
 Operation not permitted
In-Reply-To: <1439494436-944-1-git-send-email-daleg@omniti.com>
References: <1439494436-944-1-git-send-email-daleg@omniti.com>
Message-ID: <20151128185223.09e5144f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Dale Ghent,

On Thu, 13 Aug 2015 19:33:56 +0000, Dale Ghent wrote:
> Signed-off-by: Dale Ghent <daleg@omniti.com>
> ---
>  package/dcron/dcron.service | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
