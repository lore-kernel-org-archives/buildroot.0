From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 21:53:51 +0200
Subject: [Buildroot] [PATCH 7/9] package/expedite: bump to lastest commit
In-Reply-To: <1472848295-13734-7-git-send-email-romain.naour@gmail.com>
References: <1472848295-13734-1-git-send-email-romain.naour@gmail.com>
 <1472848295-13734-7-git-send-email-romain.naour@gmail.com>
Message-ID: <20160906215351.097a1e28@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Sep 2016 22:31:33 +0200, Romain Naour wrote:
> expedite from 1.15 branch doesn't build anymore with efl 1.18 due to
> API changes. Since there is no new release or 1.18 scpecific branch,
> use the latest commit.
> 
> Add a hash file.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/expedite/expedite.hash | 2 ++
>  package/expedite/expedite.mk   | 3 +--
>  2 files changed, 3 insertions(+), 2 deletions(-)
>  create mode 100644 package/expedite/expedite.hash

Applied to master, after fixing the hash file as you pointed out.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
