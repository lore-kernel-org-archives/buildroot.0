From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 17:03:49 +0200
Subject: [Buildroot] [PATCH] CHANGES: add release note for the
 permissions
In-Reply-To: <1436787388-24414-1-git-send-email-arnout@mind.be>
References: <1416586748-12936-3-git-send-email-guido@vanguardiasur.com.ar>
 <1436787388-24414-1-git-send-email-arnout@mind.be>
Message-ID: <20150713170349.441b0ab8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Mon, 13 Jul 2015 13:36:28 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Since the rsync of skeleton or rootfs now changes the permissions of
> the copied files and directories, this may break existing setups that
> rely on these permissions being kept. So add a release not explaining
> how it should be done.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  CHANGES | 11 +++++++++++
>  1 file changed, 11 insertions(+)

I've fixed the commit log as suggested by Baruch and applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
