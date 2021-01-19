From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Jan 2021 22:13:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/dcron: bump to
 1ba33c3325df48de46263276a43ed76cf9d81518
In-Reply-To: <20210103225324.974773-1-fontaine.fabrice@gmail.com>
References: <20210103225324.974773-1-fontaine.fabrice@gmail.com>
Message-ID: <20210119221336.2842f0ef@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  3 Jan 2021 23:53:24 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Add upstream link to patch
> - Use the new COPYING file
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ....c-add-newline-to-logfile-openning-error-message.patch | 1 +
>  package/dcron/dcron.hash                                  | 3 ++-
>  package/dcron/dcron.mk                                    | 8 ++++----
>  3 files changed, 7 insertions(+), 5 deletions(-)

Applied to master with a slightly tweaked commit title/log to indicate
that we're changing from a tarball to github, as the latest official
release is from May 2011, while the git repo has a number of extra
changes on top of that latest release.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
