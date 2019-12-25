From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 19:05:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/openrc: install sysv-rcs file
In-Reply-To: <20191219190135.7013-1-aduskett@gmail.com> (aduskett's message of
 "Thu, 19 Dec 2019 11:01:35 -0800")
References: <20191219190135.7013-1-aduskett@gmail.com>
Message-ID: <87sgl8s2kb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <aduskett@greenlots.com>
 > package/openrc has the file sysv-rcs which starts sysvinit services
 > not written for openrc. However, currently it is not installed to
 > the target.

 > Install this file to $(TARGET_DIR)/etc/init.d during the
 > target_install step.

 > Signed-off-by: Adam Duskett <aduskett@greenlots.com>

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
