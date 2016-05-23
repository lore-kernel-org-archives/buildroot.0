From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2016 17:06:28 +0200
Subject: [Buildroot] [PATCH next] libcurl: bump version to 7.49.0
In-Reply-To: <1463566477-50773-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1463566477-50773-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160523170628.4f7f6d0c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 May 2016 11:14:37 +0100, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/libcurl/libcurl.hash | 2 +-
>  package/libcurl/libcurl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

I've applied to master (and not next) since it fixes a security issue.
I've added the reference to the CVE pointed by Gustavo in the commit
log before applying. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
