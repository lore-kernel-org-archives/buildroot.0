From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 22:38:55 +0100
Subject: [Buildroot] [PATCH v6 3/3] package/exim: Add support for SMTP
 AUTH through Dovecot
In-Reply-To: <1414613646-24490-3-git-send-email-bernd.kuhls@t-online.de>
References: <1414613646-24490-1-git-send-email-bernd.kuhls@t-online.de>
 <1414613646-24490-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141030223855.54e21761@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 29 Oct 2014 21:14:06 +0100, Bernd Kuhls wrote:
> ---
> v6: no changes
> v5: no changes
> v4: Initial version
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/exim/exim.mk |    8 ++++++++
>  1 file changed, 8 insertions(+)

Applied, thanks. However, there was an issue with your three patches:
your SoB line was after the "---" sign, so it was stripped by git when
applying your patches. I restored it for the exim patch, but forgot for
the two previous patches.

Also, your exim patch was based on top of your ClamAV patches, so it
didn't apply cleanly. In such cases, please send your patches as part
of a patch series that include all patches, or make sure they are
properly based on master.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
