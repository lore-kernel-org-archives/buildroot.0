From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 Jul 2019 08:42:57 +0200
Subject: [Buildroot] [PATCH 1/1] utils/check-package: Add a quiet flag
In-Reply-To: <20190702185227.14435-1-brandon.maier@rockwellcollins.com>
 (Brandon Maier's message of "Tue, 2 Jul 2019 13:52:27 -0500")
References: <20190702185227.14435-1-brandon.maier@rockwellcollins.com>
Message-ID: <87sgribb0u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Brandon" == Brandon Maier <brandon.maier@rockwellcollins.com> writes:

 > When running in a CI system, stat messages become white noise. Introduce
 > an option to suppress non-error, non-warning, messages.

 > Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>

While not really a fix, it seems quite safe and it is easier when
tooling behaves the same on the various branches, so committed to
2019.02.x and 2019.05.x - Thanks.

-- 
Bye, Peter Korsgaard
