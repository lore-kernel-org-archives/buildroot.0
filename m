From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 15:24:24 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/bridge-utils: bump to version 1.7
In-Reply-To: <20200628102647.268917-1-fontaine.fabrice@gmail.com>
References: <20200628102647.268917-1-fontaine.fabrice@gmail.com>
Message-ID: <20200714152424.34a28c7c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 28 Jun 2020 12:26:47 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Update site to get latest release
> - Add a deprecated note in Config.in:
>   https://git.kernel.org/pub/scm/linux/kernel/git/shemminger/bridge-utils.git/commit/?id=ab8a2cc330253321be7bc69dea88bfaa3d48415e
> - Drop patch, not needed since:
>   https://git.kernel.org/pub/scm/linux/kernel/git/shemminger/bridge-utils.git/commit/?id=7b421143d1427e17380ff5bf93ef8fc718428c83
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Fix help text in Config.in

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
