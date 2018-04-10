From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Apr 2018 22:42:53 +0200
Subject: [Buildroot] [git commit] ntp: explicitly enable openssl-random
 when crypto is enabled
In-Reply-To: <20180204152403.ABC8388351@busybox.osuosl.org> (Peter Korsgaard's
 message of "Sun, 4 Feb 2018 16:20:38 +0100")
References: <20180204152403.ABC8388351@busybox.osuosl.org>
Message-ID: <87o9iq7pyq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=905677cbd59fb0f9f56f207b63e1fa6e7c9167d5
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > If OpenSSL is selected, --enable-openssl-random should be explicitly
 > enabled for consistency with the disable case.

 > [Peter: tweak commit text]
 > Signed-off-by: Adam Duskett <aduskett@gmail.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
