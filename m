From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 25 Jun 2007 12:55:31 +0200
Subject: [Buildroot] Make the top rule %_defconfig work
In-Reply-To: <1182763667.10703.21.camel@localhost.localdomain>
References: <1182763667.10703.21.camel@localhost.localdomain>
Message-ID: <20070625105531.GG5134@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 25, 2007 at 11:27:47AM +0200, Hans-Christian Egtvedt wrote:
>Hi,
>
>Please see the included patch as a comment to the earlier discussion
>about having _defconfig. By only searching the target/ directory it will
>not conflict with the extracted kernel and similar.
>
>It makes the most sense to be able to load a BR2 <board>_defconfig from
>the target directory. What this build target does is to overwrite
>the .config with a premade default configuration.
>
>For example as a hardware (and software) provider I would like to be
>able to build a "standard" image having a collection of applications
>useful for the board.

Applied. Thanks!
