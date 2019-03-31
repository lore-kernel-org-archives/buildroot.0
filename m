From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 12:08:42 +0200
Subject: [Buildroot] [PATCH] package/dovecot: security bump to version
 2.3.5.1
In-Reply-To: <20190330195352.32164-1-peter@korsgaard.com>
References: <20190330195352.32164-1-peter@korsgaard.com>
Message-ID: <20190331120842.0f389fd8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 30 Mar 2019 20:53:52 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issue:
> 
>  * CVE-2019-7524: Missing input buffer size validation leads into
>    arbitrary buffer overflow when reading fts or pop3 uidl header
>    from Dovecot index. Exploiting this requires direct write access to
>    the index files.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/dovecot/dovecot.hash | 2 +-
>  package/dovecot/dovecot.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
