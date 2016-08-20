From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 22:37:05 +0200
Subject: [Buildroot] [PATCH 2/2] glib-networking: specify
 ca-certificates pathspec
In-Reply-To: <1471711731-462-2-git-send-email-gustavo@zacarias.com.ar>
References: <1471711731-462-1-git-send-email-gustavo@zacarias.com.ar>
 <1471711731-462-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160820223705.44931438@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Aug 2016 13:48:51 -0300, Gustavo Zacarias wrote:
> Otherwise the configure script will probe the distro directories for it
> and it may not match what we use, for example fedora uses /etc/pki
> instead of /etc/ssl.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/glib-networking/glib-networking.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
