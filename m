From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 20:27:22 +0200
Subject: [Buildroot] [PATCH 1/2] samba: Remove execution rights from
 smb.conf
In-Reply-To: <1407176057-13180-1-git-send-email-benoit.thebaudeau@advansee.com>
References: <1407176057-13180-1-git-send-email-benoit.thebaudeau@advansee.com>
Message-ID: <20140804202722.32d3e10f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Mon,  4 Aug 2014 20:14:16 +0200, Beno?t Th?baudeau wrote:
> /etc/samba/smb.conf should be installed without execution rights since it is a
> simple text configuration file.
> 
> Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>
> ---
>  package/samba/samba.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
