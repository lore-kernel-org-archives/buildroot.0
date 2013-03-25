From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Mar 2013 00:28:09 +0100
Subject: [Buildroot] [PATCH 14/15] update gitignore
In-Reply-To: <cover.1364253936.git.yann.morin.1998@free.fr>
References: <cover.1364253936.git.yann.morin.1998@free.fr>
Message-ID: <4c0439322ad553998f69204c433a7135a0adbaca.1364253936.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

Do not track *.pyc files (from modules embedded in Buildroot source
tree).

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Thanks to Thomas P. for the suggestion ;)
---
 .gitignore |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/.gitignore b/.gitignore
index 685a9c2..bb02d9f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -12,3 +12,4 @@
 *.orig
 *.rej
 *~
+*.pyc
-- 
1.7.2.5
