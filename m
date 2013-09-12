From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 13 Sep 2013 00:06:43 +0200
Subject: [Buildroot] [PATCH 1/3] downloads: add basic CVS support
In-Reply-To: <1378901526-29167-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 11 Sep 2013 09:12:04 -0300")
References: <1378901526-29167-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87k3ilpudo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> The support is for pserver mode anonymous CVS.
 Gustavo> source-check is based on login since many servers don't support or have
 Gustavo> ls/rls disabled.

 Gustavo> Usage is pretty straightforward.
 Gustavo> PKG_SITE defines the site hostname and remote directory.
 Gustavo> The module is defined by the bare package name.
 Gustavo> Version is date based.

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  Config.in               |  4 ++++
 Gustavo>  package/pkg-download.mk | 39 +++++++++++++++++++++++++++++----------
 Gustavo>  package/pkg-generic.mk  |  2 ++
 Gustavo>  3 files changed, 35 insertions(+), 10 deletions(-)

 Gustavo> diff --git a/Config.in b/Config.in
 Gustavo> index 65c29b4..158a8ab 100644
 Gustavo> --- a/Config.in
 Gustavo> +++ b/Config.in
 Gustavo> @@ -42,6 +42,10 @@ config BR2_GIT
 Gustavo>  	string "Git command"
 Gustavo>  	default "git"
 
 Gustavo> +config BR2_CVS
 Gustavo> +	string "Cvs command"

I've changed this to "CVS command" and committed, thanks.

-- 
Bye, Peter Korsgaard
