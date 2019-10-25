From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Oct 2019 10:29:11 +0200
Subject: [Buildroot] [PATCH 1/3] package/lld: create
 $(HOST_DIR)/$(GNU_TARGET_NAME)/bin before create symlinks
In-Reply-To: <20191024202211.15619-1-romain.naour@smile.fr> (Romain Naour's
 message of "Thu, 24 Oct 2019 22:22:09 +0200")
References: <20191024202211.15619-1-romain.naour@smile.fr>
Message-ID: <878sp944a0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > $(HOST_DIR)/$(GNU_TARGET_NAME)/bin directory may not exist before creating
 > lld symlinks.

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > Cc: Joseph Kogut <joseph.kogut@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
