From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Oct 2019 10:39:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/nfs-utils: fix nfs-utils_env.sh
 path
In-Reply-To: <20191003140410.45651-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Thu, 3 Oct 2019 08:04:10 -0600")
References: <20191003140410.45651-1-james.hilliard1@gmail.com>
Message-ID: <87h83t8az9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > Per upstream commit bf12e1fa9f48e8ee91a2869e69484c70595b5160
 > https://cdn.kernel.org/pub/linux/utils/nfs-utils/1.3.4/1.3.4-Changelog

 > Currently nfs-utils_env.sh is installed in a
 > directory that is own by systemd. They requested
 > via https://bugzilla.redhat.com/show_bug.cgi?id=1303113
 > to move the script into /usr/libexec/nfs-utils

 > As such we must update the installation path for nfs-utils_env.sh.

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed to 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
