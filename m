From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 18:44:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/ntp: increase pool server count
 in default config
In-Reply-To: <1432093452-18281-1-git-send-email-imrehg@gmail.com>
References: <1432093452-18281-1-git-send-email-imrehg@gmail.com>
Message-ID: <20150713184450.69f7a58c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gergely Imreh,

On Wed, 20 May 2015 03:44:17 +0000, Gergely Imreh wrote:
> To protect agains 1 falsticker NTP server, the client needs to connect
> to at least 4 servers.
> 
> Source:
>  http://support.ntp.org/bin/view/Support/SelectingOffsiteNTPServers
>  5.3.3. Upstream Time Server Quantity
> 
> Signed-off-by: Gergely Imreh <imrehg@gmail.com>
> ---
>  package/ntp/ntpd.etc.conf | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
