From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Jan 2018 22:40:16 +0100
Subject: [Buildroot] [PATCH 1/1] support/scripts: sort pie charts
In-Reply-To: <20180102140723.GA9316@australia>
References: <20180102140723.GA9316@australia>
Message-ID: <20180102224016.3fa727b2@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 2 Jan 2018 15:07:23 +0100, Thomas De Schampheleire wrote:
> Make sure that the pie charts produced by 'graph-build' and 'graph-size'
> targets are sorted on the size of each piece of the pie. Otherwise, making
> visual analysis is difficult, as one needs to look at the legends of each
> piece and do the sorting manually in their head.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  support/scripts/graph-build-time | 2 +-
>  support/scripts/size-stats       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
