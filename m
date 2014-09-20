From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 20 Sep 2014 20:30:11 +0200
Subject: [Buildroot] [PATCH 1/2] docs: move Buildroot CSS code into its
	own	file
In-Reply-To: <1411218824-31293-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1411218824-31293-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1411218824-31293-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <43a2f388-2853-45ac-bf7d-9bb997c04b16@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> schreef:
>In preparation to the addition of more CSS code, this commit moves the
>Buildroot site specific CSS code from header.html to a dedicated CSS
>file.
>
>Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>---
> docs/css/buildroot.css | 13 +++++++++++++
> docs/header.html       | 12 +-----------
> 2 files changed, 14 insertions(+), 11 deletions(-)
> create mode 100644 docs/css/buildroot.css
>
>diff --git a/docs/css/buildroot.css b/docs/css/buildroot.css
>new file mode 100644
>index 0000000..95e6e94
>--- /dev/null
>+++ b/docs/css/buildroot.css
>@@ -0,0 +1,13 @@
>+body {
>+    padding-top: 60px;
>+    padding-bottom: 40px;
>+}
>+
>+.button_column{

A space before the brace would be nice, but in any case:

Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
