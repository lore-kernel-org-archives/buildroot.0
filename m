From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jan 2018 13:21:12 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] package/kmsxx: don't
 install static libraries when BR2_SHARED_STATIC_LIBS=y
In-Reply-To: <20180116194020.C1CC483C30@busybox.osuosl.org> (Peter Korsgaard's
 message of "Tue, 16 Jan 2018 19:43:26 +0100")
References: <20180116194020.C1CC483C30@busybox.osuosl.org>
Message-ID: <87wozz1qrr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=fe3ac2c20aef525e51ff425f8acbb14f9b7a9334
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

 > The kmsxx build system can only build either shared libraries *or*
 > static libraries, not both. Therefore, the build currently fails when
 > BR2_SHARED_STATIC_LIBS=y because we try to install the static
 > libraries, that haven't been built.

 > We fix this by not installing the static libraries when
 > BR2_SHARED_STATIC_LIBS=y, making BR2_SHARED_STATIC_LIBS=y essentially
 > the same as BR2_SHARED_LIBS=y for this package.

 > Fixes bug #10331.

 > Reported-by:  Frederic MATHIEU <frederic.mathieu@dualis.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
