From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 23:38:40 +0200
Subject: [Buildroot] [PATCH 1/2] get-developers: use --cc instead of
 --to for developers
In-Reply-To: <1476723692-22814-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1476723692-22814-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20161019233840.195ce1e1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Oct 2016 22:31:31 +0530, Rahul Bedarkar wrote:
> Output of get-developers script in our manual uses --cc for developers,
> but actual output of get-developers script uses --to. This patch makes
> code consistent with documentation, by using --cc for developers.
> 
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  support/scripts/get-developers | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
