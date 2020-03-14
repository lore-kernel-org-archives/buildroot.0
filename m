From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 17:48:50 +0100
Subject: [Buildroot] [PATCH] package/swig: create a symlink for swig3.0
In-Reply-To: <20200224101252.29177-1-yegorslists@googlemail.com>
 (yegorslists's message of "Mon, 24 Feb 2020 11:12:52 +0100")
References: <20200224101252.29177-1-yegorslists@googlemail.com>
Message-ID: <87sgiavq4t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > For now swig package creates a symlink to the latest swig version
 > i.e. swig4.0. If the host already has both CMake 3.10 and earlier
 > swig version then the earlier version (swig2.0 or swig3.0) will
 > be detected. This happens because CMake 3.10 doesn't know about
 > swig4.0 and thus searches for swig3.0 first and finds it on the
 > host.

 > With the new symlink CMake will find buildroot's swig binary.

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed to 2019.11.x (2019.02.x uses swig 3.0.12), thanks.

-- 
Bye, Peter Korsgaard
