From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Jan 2015 22:11:33 +0100
Subject: [Buildroot] [PATCH] automake: bump version to 1.15
In-Reply-To: <1420535267-45405-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1420535267-45405-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150107221133.0664c6e7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Tue, 6 Jan 2015 09:07:47 +0000, Vicente Olivert Riera wrote:
> -Bump version to 1.15
> -Add a hash file
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/automake/automake.hash |    2 ++
>  package/automake/automake.mk   |    2 +-
>  2 files changed, 3 insertions(+), 1 deletions(-)
>  create mode 100644 package/automake/automake.hash

Thanks, applied. Let's see how many autobuilder explosions this is
going to cause :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
