From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Jun 2012 22:50:22 +0200
Subject: [Buildroot] [PATCH 09/10] qt: make $(HOST_DIR)/usr/mkspecs a
	symlink to $(STAGING_DIR)/usr/mkspecs
In-Reply-To: <6e3c4b7bdba8afe3d9d50b2e6af7144f9606a6e0.1338653505.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 2 Jun 2012 18:13:59 +0200")
References: <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
 <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
 <6e3c4b7bdba8afe3d9d50b2e6af7144f9606a6e0.1338653505.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87bokpefox.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> In fact, not only qt can install stuff in $(STAGING_DIR)/usr/mkspecs,
 Thomas> but also libraries that which to integrate with qmake, such as

s/which/wish/

 Thomas> qwt. However, qmake and al. will look inside $(HOST_DIR)/usr/mkspecs,
 Thomas> so the easiest solution is to have a symbolic between the two

s/symbolic/symbolic link/

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
