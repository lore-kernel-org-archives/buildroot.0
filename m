From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 11:45:36 +0200
Subject: [Buildroot] [PATCH 11/16] package/samba: use FHS dirs
In-Reply-To: <1421684056-5266-12-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
 <1421684056-5266-12-git-send-email-maxtram95@gmail.com>
Message-ID: <20150406114536.324980bf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxim Mikityanskiy,

On Mon, 19 Jan 2015 18:14:11 +0200, Maxim Mikityanskiy wrote:
> Clean up system directories by making samba conform to FHS and by using
> subdirectories e.g. /var/log/samba and /var/run/samba instead of
> /var/log and /var/run.
> 
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
> ---
>  package/samba/S91smb   |  5 +++--
>  package/samba/samba.mk | 10 +++++-----
>  2 files changed, 8 insertions(+), 7 deletions(-)

Even though we recently marked the samba package as deprecated, I've
applied this patch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
