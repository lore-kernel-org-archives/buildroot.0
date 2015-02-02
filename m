From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 2 Feb 2015 17:22:41 +0100
Subject: [Buildroot] [PATCH] %_defconfig: save the path to the defconfig
In-Reply-To: <1422891286-521-1-git-send-email-arnout@mind.be>
References: <1422891286-521-1-git-send-email-arnout@mind.be>
Message-ID: <CAAXf6LV9rTWG=-gA6_z1XtxscoSL-JcGppf7aDPRcN58TbUcsg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 2, 2015 at 4:34 PM, Arnout Vandecappelle (Essensium/Mind)
<arnout@mind.be> wrote:
> We have the BR2_DEFCONFIG feature that saves the path to the defconfig
> file that was specified on the command line, so that a later
> savedefconfig would immediately save to the right location. This wasn't
> done for the defconfigs in the configs/ directory, however, to avoid
> accidentally overwriting them.
>
> Now we decided that it would be more useful to overwrite the defconfigs
> in the configs/ directory after all. To do this, we pass the path to
> that defconfig in the environment.
>
> Cc: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
