From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jan 2016 23:26:47 +0100
Subject: [Buildroot] [PATCH v2] support/download: Aternative access
 methods to CVS
In-Reply-To: <1452888795-14158-1-git-send-email-joao@datacom.ind.br>
References: <1452862510-31390-1-git-send-email-joao@datacom.ind.br>
 <1452888795-14158-1-git-send-email-joao@datacom.ind.br>
Message-ID: <20160120232647.3c7e1b40@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Joao Mano,

On Fri, 15 Jan 2016 18:13:15 -0200, Joao Mano wrote:
> Allows user to specify other access methods than
> :pserver:anonymous@ on CVS repositories.
> 
> This shall be specifically defined along MODULE_SITE string.
> 
> Signed-off-by: Joao Mano <joao@datacom.ind.br>
> 
> ---
> Changes v1 -> v2:
>  - Documentation improved with examples. (Thomas Petazzoni suggestion)

Thanks, applied after doing some changes (mainly suggested by Yann) :

    [Thomas:
     - as suggested by Yann, quote the variable expansion
     - as suggested by Yann, use a regexp match
     - tweak commit log]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
