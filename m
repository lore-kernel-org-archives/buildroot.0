From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Dec 2020 11:49:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/pkg-golang.mk: postpone
 evaluation of TARGET_DIR and HOST_DIR
In-Reply-To: <20201218055856.3489177-1-tianyuanhao@aliyun.com> (Tian Yuanhao
 via buildroot's message of "Fri, 18 Dec 2020 13:58:56 +0800")
References: <20201218055856.3489177-1-tianyuanhao@aliyun.com>
Message-ID: <87wnxaktea.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Tian" == Tian Yuanhao via buildroot <buildroot@busybox.net> writes:

 > When BR2_PER_PACKAGE_DIRECTORIES=y, $(TARGET_DIR) is evaluated as
 > $(BASE_DIR)/target, but $$(TARGET_DIR) is evaluated as
 > $(BASE_DIR)/per-package/$(PKG)_NAME/target.

 > Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>

Committed to 2020.02.x, 2020.08.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
