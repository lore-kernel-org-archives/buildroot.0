From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 15 Sep 2010 09:28:04 +0200
Subject: [Buildroot] [PATCH] samba: add patch to fix buffer overrun
 vulnerability CVE-2010-3069
In-Reply-To: <1284535590-21711-1-git-send-email-s.neumann@raumfeld.com>
References: <1284535590-21711-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1284535684.1677.0.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2010-09-15 at 09:26 +0200, Sven Neumann wrote:
> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
> ---
>  package/samba/samba-3.3.13-CVE-2010-3069.patch |   86 ++++++++++++++++++++++++
>  1 files changed, 86 insertions(+), 0 deletions(-)
>  create mode 100644 package/samba/samba-3.3.13-CVE-2010-3069.patch

See http://www.samba.org/samba/security/CVE-2010-3069.html for details.


Sven
