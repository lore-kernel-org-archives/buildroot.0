From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 29 Sep 2015 15:23:01 +0200
Subject: [Buildroot] [help] Add support for a new board
In-Reply-To: <560A8DC6.9010409@synopsys.com>
References: <560A8DC6.9010409@synopsys.com>
Message-ID: <1443532981.4703.5.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joao,

On Di, 2015-09-29 at 14:10 +0100, Joao Pinto wrote:
> Hi!
> 
> I need to submit to buildroot the support for a new board which
> consists of:
> - kernel defconfig
> - fs overlay (etc/inittab)
> - buildroot defconfig
> 
> Could you please tell me what is the standard procedure for 
> submission?

Buildroot has a pretty good manual [1]. Furthermore you can have a look
at all the different board configs in the configs directory [2].
Patchwork has a patch tracking list for Buildroot [3].

Best regards
J?rg Krause

[1] http://nightly.buildroot.org/
[2] http://git.buildroot.net/buildroot/tree/configs
[3] http://patchwork.ozlabs.org/project/buildroot/list/
