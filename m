From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Dec 2015 17:47:30 +0100
Subject: [Buildroot] [PATCH] openldap: bump version to 2.4.43
In-Reply-To: <1448966532-21914-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1448966532-21914-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151201174730.4af014c7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Tue, 1 Dec 2015 10:42:12 +0000, Vicente Olivert Riera wrote:
> - Bump version to 2.4.43
> - Use md5 and sha1 upstream provided hashes. This combination is
>   stronger than a sha256 hash.
> - Switch to an http download site to avoid problems with firewalls
>   blocking the ftp.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/openldap/openldap.hash | 8 ++++----
>  package/openldap/openldap.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)

Applied to next-soon-to-be-master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
