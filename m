From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Jan 2019 16:01:57 +0100
Subject: [Buildroot] [PATCH 1/1] readline: bump to version 8.0
In-Reply-To: <20190111215020.5701-1-fontaine.fabrice@gmail.com>
References: <20190111215020.5701-1-fontaine.fabrice@gmail.com>
Message-ID: <20190112160157.102b3758@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Jan 2019 22:50:20 +0100, Fabrice Fontaine wrote:
> - Remove first patch (already in version) and so remove
>   READLINE_AUTOCONF as configure.ac is not patched anymore
> - Use the new --disable-install-examples option and remove
>   READLINE_PURGE_EXAMPLES
> - Remove READLINE_INSTALL_PC_FILE as readline.pc is installed since:
>   http://git.savannah.gnu.org/cgit/readline.git/commit/Makefile.in?id=8e6ccd0373d77b86ed37a9a7d232ccfea3d6670c
> - Remove READLINE_INSTALL_FIXUPS_SHARED (libraries are installed with
>   correct rights)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...c-readline.pc.in-fix-Requires.private-val.patch | 62 ----------------------
>  package/readline/readline.hash                     |  5 +-
>  package/readline/readline.mk                       | 29 +---------
>  3 files changed, 6 insertions(+), 90 deletions(-)
>  delete mode 100644 package/readline/0001-configure.ac-readline.pc.in-fix-Requires.private-val.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
