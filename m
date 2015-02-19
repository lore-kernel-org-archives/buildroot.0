From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 23:18:48 +0100
Subject: [Buildroot] [PATCH] netsnmp: Make server and client
 installation optional
In-Reply-To: <1424187759-534-1-git-send-email-stefan.sorensen@spectralink.com>
References: <1424187759-534-1-git-send-email-stefan.sorensen@spectralink.com>
Message-ID: <20150219231848.2022d896@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan S?rensen,

On Tue, 17 Feb 2015 16:42:39 +0100, Stefan S?rensen wrote:
> The netsnmp package consists of both a server and a number of client
> tools, this makes the installation of both parts optional.
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> ---
>  package/netsnmp/Config.in  | 12 ++++++++++++
>  package/netsnmp/netsnmp.mk | 10 ++++++++++
>  2 files changed, 22 insertions(+)

Applied to the next branch, after doing some minor changes:

    [Thomas:
      - Add explicit --enable-{agent,applications}, and use positive logic.
      - Remove "net-snmp" from the new Config.in option prompts, since
        they are already visible under the netsnmp package option.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
