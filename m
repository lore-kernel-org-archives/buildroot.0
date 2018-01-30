From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jan 2018 23:02:52 +0100
Subject: [Buildroot] [PATCH 1/2] bootstrap: bump version to 4.0.0
In-Reply-To: <20180124220357.2861-1-Adamduskett@outlook.com>
References: <20180124220357.2861-1-Adamduskett@outlook.com>
Message-ID: <20180130230252.56edae11@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 24 Jan 2018 17:03:56 -0500, Adam Duskett wrote:
> other changes:
>   - Add a license file to bootstrap.mk
>   - Add a hash for the license file to bootstrap.hash
>   - Remove copying bootstrap-theme.min.css as it's no longer included.
>   - Remove copying fonts folder as it's no longer included.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
>  package/bootstrap/bootstrap.hash | 3 ++-
>  package/bootstrap/bootstrap.mk   | 8 ++------
>  2 files changed, 4 insertions(+), 7 deletions(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
