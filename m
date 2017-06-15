From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jun 2017 23:17:35 +0200
Subject: [Buildroot] [PATCH v6 1/1] linuxptp: new package
In-Reply-To: <1496861069-6958-1-git-send-email-brain@jikos.cz>
References: <1496861069-6958-1-git-send-email-brain@jikos.cz>
Message-ID: <20170615231735.2e507a77@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Jun 2017 20:44:29 +0200, Petr Kulhavy wrote:
> Add the Linux PTP Project package.
> http://linuxptp.sourceforge.net/
> 
> The SysV and systemd init scripts start the daemon in slave-only mode on eth0
> and synchronize the system clock to PTP.
> 
> Signed-off-by: Petr Kulhavy <brain@jikos.cz>

Now that your patch has been accepted and applied, it is being tested
by our autobuild infrastructure, and numerous build failures have
appeared:

  http://autobuild.buildroot.net/?reason=linuxptp-97c351cafd7327fd28047580c9e2528a6f7e742b

You should normally have received a daily e-mail with the summary of
those build failures.

Do you think you will get the chance of investigating those issues, and
providing additional patches to fix them?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
