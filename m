From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue,  4 Apr 2017 19:50:15 -0300
Subject: [Buildroot] [PATCH 07/11] python-pylibftdi: check hash
In-Reply-To: <20170404225019.27916-1-ricardo.martincoski@gmail.com>
References: <20170404225019.27916-1-ricardo.martincoski@gmail.com>
Message-ID: <20170404225019.27916-7-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently the hash is not checked, returning this message:
WARNING: no hash file for pylibftdi-0.15.0.tar.gz

Rename the .hash file to use the package name.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
From get-developers:
Cc: Christian Kellermann <christian.kellermann@solectrix.de>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pylibftdi/{python-libftdi.hash => python-pylibftdi.hash} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/python-pylibftdi/{python-libftdi.hash => python-pylibftdi.hash} (100%)

diff --git a/package/python-pylibftdi/python-libftdi.hash b/package/python-pylibftdi/python-pylibftdi.hash
similarity index 100%
rename from package/python-pylibftdi/python-libftdi.hash
rename to package/python-pylibftdi/python-pylibftdi.hash
-- 
2.11.0
