From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 7 Oct 2014 15:30:50 +0100
Subject: [Buildroot] [PATCH] ser2net: Add a hash file
In-Reply-To: <1412692250-13513-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1412692250-13513-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1412692250-13513-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/ser2net/ser2net.hash |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)
 create mode 100644 package/ser2net/ser2net.hash

diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
new file mode 100644
index 0000000..d24e3a8
--- /dev/null
+++ b/package/ser2net/ser2net.hash
@@ -0,0 +1,6 @@
+md5 cd937041144de83d41d811521e72158c ser2net-2.10.0.tar.gz
+sha1 80e826ef1630cbf282d8a656754967d0f842ecba ser2net-2.10.0.tar.gz
+sha224 1d851e90fde37db55109a7399f3c7166628ca23d53e87f2c65b5b01a ser2net-2.10.0.tar.gz
+sha256 98f6193225338e25f35302fef5e1f16688693ed43e7b3c3e9e09187eb54547ac ser2net-2.10.0.tar.gz
+sha384 b4ea0014e5ffd303f7a2a6b0cd31ec2b24640fea535cd87631aa685b7b33464261dee0e4baba8c418209767c83961dca ser2net-2.10.0.tar.gz
+sha512 dd3e37619b10d8bf20d738e90c253bc2d109e0a57ee9f3a8b2a85a69399afa5a8459a4602b2856f0b655427023a36c78330851bf7f8d8da0f28d1fe22c1d5e10 ser2net-2.10.0.tar.gz
-- 
1.7.1
