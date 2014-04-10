From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 10 Apr 2014 18:37:55 +0200
Subject: [Buildroot] [PATCH 1/1] pypcap: new package
In-Reply-To: <1397145313-35723-1-git-send-email-mlweber1@rockwellcollins.com>
References: <1397145313-35723-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <2f8d6b8f-0cbe-4f65-b381-dc84457e3e33@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt Weber <mlweber1@rockwellcollins.com> schreef:
>Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
>---
> package/Config.in                      |  1 +
> package/python-pypcap/Config.in        |  9 +++++++++
> package/python-pypcap/python-pypcap.mk | 22 ++++++++++++++++++++++
> 3 files changed, 32 insertions(+)
> create mode 100644 package/python-pypcap/Config.in
> create mode 100644 package/python-pypcap/python-pypcap.mk
>
>diff --git a/package/Config.in b/package/Config.in
>index 46c4ba4..69ff49d 100644
>--- a/package/Config.in
>+++ b/package/Config.in
>@@ -418,6 +418,7 @@ source "package/python-pyasn/Config.in"
> source "package/python-pycrypto/Config.in"
> source "package/python-pygame/Config.in"
> source "package/python-pyparsing/Config.in"
>+source "package/python-pypcap/Config.in"
> source "package/python-pyro/Config.in"
> source "package/python-pysnmp/Config.in"
> source "package/python-pysnmp-apps/Config.in"
>diff --git a/package/python-pypcap/Config.in b/package/python-pypcap/Config.in
>new file mode 100644
>index 0000000..a1ec7de
>--- /dev/null
>+++ b/package/python-pypcap/Config.in
>@@ -0,0 +1,9 @@
>+config BR2_PACKAGE_PYTHON_PYPCAP
>+	bool "python-pypcap"
>+	depends on BR2_PACKAGE_PYTHON
>+	select BR2_PACKAGE_LIBPCAP
>+	help
>+	  The pypcap module is a object-oriented wrapper of the C libpcap library.

an object-oriented

Best regards,
Thomas
