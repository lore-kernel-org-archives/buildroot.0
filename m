From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Mar 2013 22:33:40 +0100
Subject: [Buildroot] [PATCH 3/5] urg: new package
In-Reply-To: <edf55e40bfad391065a36c7b56263e0b6f1b001b.1363063832.git.s.martin49@gmail.com>
 (Samuel Martin's message of "Tue, 12 Mar 2013 05:58:41 +0100")
References: <cover.1363063832.git.s.martin49@gmail.com>
 <cover.1363063832.git.s.martin49@gmail.com>
 <edf55e40bfad391065a36c7b56263e0b6f1b001b.1363063832.git.s.martin49@gmail.com>
Message-ID: <87zjy13e4r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> Cc: Eric Jarrige <eric.jarrige@armadeus.org>
 Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 Samuel> ---
 Samuel> Changes since v1:
 Samuel> - fix dependencies
 Samuel> - fix license
 Samuel> ---
 Samuel>  package/Config.in     |  1 +
 Samuel>  package/urg/Config.in | 13 +++++++++++++
 Samuel>  package/urg/urg.mk    | 27 +++++++++++++++++++++++++++
 Samuel>  3 files changed, 41 insertions(+)
 Samuel>  create mode 100644 package/urg/Config.in
 Samuel>  create mode 100644 package/urg/urg.mk

 Samuel> diff --git a/package/Config.in b/package/Config.in
 Samuel> index b8b1e60..7d66b75 100644
 Samuel> --- a/package/Config.in
 Samuel> +++ b/package/Config.in
 Samuel> @@ -464,6 +464,7 @@ source "package/libv4l/Config.in"
 Samuel>  source "package/mtdev/Config.in"
 Samuel>  source "package/neardal/Config.in"
 Samuel>  source "package/pcsc-lite/Config.in"
 Samuel> +source "package/urg/Config.in"
 Samuel>  endmenu
 
 Samuel>  menu "Javascript"
 Samuel> diff --git a/package/urg/Config.in b/package/urg/Config.in
 Samuel> new file mode 100644
 Samuel> index 0000000..c8d3b70
 Samuel> --- /dev/null
 Samuel> +++ b/package/urg/Config.in
 Samuel> @@ -0,0 +1,13 @@
 Samuel> +config BR2_PACKAGE_URG
 Samuel> +	bool "urg library"

We normally don't add stuff like " library", so I've dropped that and
committed, thanks.

-- 
Bye, Peter Korsgaard
