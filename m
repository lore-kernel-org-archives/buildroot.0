From: Mauro Condarelli <mc5686@mclink.it>
Date: Mon,  1 Feb 2016 02:25:34 +0100
Subject: [Buildroot] [PATCH 5/7] update of .hash files.
In-Reply-To: <1454289936-10654-1-git-send-email-mc5686@mclink.it>
References: <1454289936-10654-1-git-send-email-mc5686@mclink.it>
Message-ID: <1454289936-10654-6-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/python-autobahn/python-autobahn.hash             | 3 +++
 package/python-characteristic/python-characteristic.hash | 3 +++
 package/python-click/python-click.hash                   | 3 +++
 package/python-crossbar/python-crossbar.hash             | 9 +++++++++
 package/python-cryptography/python-cryptography.hash     | 3 +++
 package/python-mistune/python-mistune.hash               | 3 +++
 package/python-netaddr/python-netaddr.hash               | 3 +++
 package/python-pyasn1-modules/python-pyasn1-modules.hash | 3 +++
 8 files changed, 30 insertions(+)
 create mode 100644 package/python-autobahn/python-autobahn.hash
 create mode 100644 package/python-characteristic/python-characteristic.hash
 create mode 100644 package/python-click/python-click.hash
 create mode 100644 package/python-crossbar/python-crossbar.hash
 create mode 100644 package/python-mistune/python-mistune.hash
 create mode 100644 package/python-netaddr/python-netaddr.hash
 create mode 100644 package/python-pyasn1-modules/python-pyasn1-modules.hash

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
new file mode 100644
index 0000000..6d28770
--- /dev/null
+++ b/package/python-autobahn/python-autobahn.hash
@@ -0,0 +1,3 @@
+# Locally computed.
+md5	13b2d91917b1e272359ed323236565c1  autobahn-0.11.0.tar.gz
+sha256	e7aea216e2a3bb41a4fec235399ece8bfbc0be4ef9567e1ed6927db7fa35f851  autobahn-0.11.0.tar.gz
diff --git a/package/python-characteristic/python-characteristic.hash b/package/python-characteristic/python-characteristic.hash
new file mode 100644
index 0000000..e9ef879
--- /dev/null
+++ b/package/python-characteristic/python-characteristic.hash
@@ -0,0 +1,3 @@
+# Locally computed.
+md5	b249368dd021fde1c06b4802867c0913  characteristic-14.3.0.tar.gz
+sha256	ded68d4e424115ed44e5c83c2a901a0b6157a959079d7591d92106ffd3ada380  characteristic-14.3.0.tar.gz
diff --git a/package/python-click/python-click.hash b/package/python-click/python-click.hash
new file mode 100644
index 0000000..c0edb8b
--- /dev/null
+++ b/package/python-click/python-click.hash
@@ -0,0 +1,3 @@
+# Locally computed.
+md5	83252a8095397b1f5f710fdd58b484d9  click-6.2.tar.gz
+sha256	fba0ff70f5ebb4cebbf64c40a8fbc222fb7cf825237241e548354dabe3da6a82  click-6.2.tar.gz
diff --git a/package/python-crossbar/python-crossbar.hash b/package/python-crossbar/python-crossbar.hash
new file mode 100644
index 0000000..b476d9b
--- /dev/null
+++ b/package/python-crossbar/python-crossbar.hash
@@ -0,0 +1,9 @@
+# Locally computed.
+md5	61581d3ce01201a5540bae22721f64e8  crossbar-0.11.2.tar.gz
+sha256	2b59eda29f9095107c66678a0f48726b917936a1e9e1ffb54df9134049891c14  crossbar-0.11.2.tar.gz
+# Locally computed.
+md5	a45f883c3e54ef8929d0c965ef656657  crossbar-v0.11.1.tar.gz
+sha256	3f008a011427bcaee6ae33facecffd04f80c31c04d86b95eaf7f13a68e614248  crossbar-v0.11.1.tar.gz
+# Locally computed.
+md5	1d1f68ee068e4b66a3c04c05fe96b76d  crossbar-v0.11.2.tar.gz
+sha256	95b80777375e659d04dca33c04414c184537bc2c88bd79d294c249340c0d379d  crossbar-v0.11.2.tar.gz
diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 0358624..f828fb4 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,3 +1,6 @@
 # md5 from https://pypi.python.org/pypi?:action=show_md5&digest=15eeba9e31f852bac21155baa3dfbc61, sha256 locally computed
 md5     15eeba9e31f852bac21155baa3dfbc61  cryptography-1.1.2.tar.gz
 sha256  7f51459f84d670444275e615839f4542c93547a12e938a0a4906dafe5f7de153  cryptography-1.1.2.tar.gz
+# Locally computed.
+md5	02798acc5e2d5dbcf6e792a24fc05b95  cryptography-1.2.1.tar.gz
+sha256	a13217a03a47e743d26edff7299e4be7358c2fd12a223ac5d6de3229690b6ee5  cryptography-1.2.1.tar.gz
diff --git a/package/python-mistune/python-mistune.hash b/package/python-mistune/python-mistune.hash
new file mode 100644
index 0000000..d4098b2
--- /dev/null
+++ b/package/python-mistune/python-mistune.hash
@@ -0,0 +1,3 @@
+# Locally computed.
+md5	057bc28bf629d6a1283d680a34ed9d0f  mistune-0.7.1.tar.gz
+sha256	6076dedf768348927d991f4371e5a799c6a0158b16091df08ee85ee231d929a7  mistune-0.7.1.tar.gz
diff --git a/package/python-netaddr/python-netaddr.hash b/package/python-netaddr/python-netaddr.hash
new file mode 100644
index 0000000..d2e1c91
--- /dev/null
+++ b/package/python-netaddr/python-netaddr.hash
@@ -0,0 +1,3 @@
+# Locally computed.
+md5	c65bb34f8bedfbbca0b316c490cd13a0  netaddr-0.7.18.tar.gz
+sha256	a1f5c9fcf75ac2579b9995c843dade33009543c04f218ff7c007b3c81695bd19  netaddr-0.7.18.tar.gz
diff --git a/package/python-pyasn1-modules/python-pyasn1-modules.hash b/package/python-pyasn1-modules/python-pyasn1-modules.hash
new file mode 100644
index 0000000..81690d6
--- /dev/null
+++ b/package/python-pyasn1-modules/python-pyasn1-modules.hash
@@ -0,0 +1,3 @@
+# Locally computed.
+md5	178129bc7fbf07215c25230c5f053f81  pyasn1-modules-0.0.8.tar.gz
+sha256	10561934f1829bcc455c7ecdcdacdb4be5ffd3696f26f468eb6eb41e107f3837  pyasn1-modules-0.0.8.tar.gz
-- 
2.1.4
