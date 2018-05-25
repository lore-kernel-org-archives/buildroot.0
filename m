From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 25 May 2018 14:29:19 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-05-24
In-Reply-To: <20180525060009.E646D20D84@mail.bootlin.com>
References: <20180525060009.E646D20D84@mail.bootlin.com>
Message-ID: <5a56c6c8-aa97-63f0-160f-7b8d14220650@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Le 25/05/2018 ? 08:00, Thomas Petazzoni a ?crit?:
> Hello,
> 
> Results for branch 'master'
> ===========================
> 
> Classification of failures by reason
> ------------------------------------
> 
>            bash-completion-2.8 | 1 
> 
> Detail of failures
> ------------------
> 
>          arm |            bash-completion-2.8 | NOK | http://autobuild.buildroot.net/results/7eea0f512695605714cf2d8c971778d4784b4c75 | ORPH

It's a parallel build issue.
The STAGING_DIR/usr/share/bash-completion/completions directory is not created yet.

Reported upstream:
https://github.com/scop/bash-completion/issues/212

Best regards,
Romain
