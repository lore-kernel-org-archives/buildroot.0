From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 5 Feb 2019 10:47:38 +0100
Subject: [Buildroot] [WIP] support/testing: add test to verify 'scp'
 download via BR2_PRIMARY_SITE
In-Reply-To: <20190205094603.28989-1-patrickdepinguin@gmail.com>
References: <20190205094603.28989-1-patrickdepinguin@gmail.com>
Message-ID: <CAAXf6LU-0+xu8kNEC0Zm6SVPuAk_dGqvtmgBCECWQyUrXWc-Xw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El mar., 5 feb. 2019 a las 10:46, Thomas De Schampheleire
(<patrickdepinguin@gmail.com>) escribi?:
>
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>
> Recently it was found that the scp download infrastructure was broken.
> To avoid future failures, create a test that verifies that the scp command
> receives the expected arguments.
>

Note: this is marked WIP because:

1. it should be rebased when Ricardo's patches to refactor the
testsuite into runtime and build-time tests is merged
2. it relies on the scp fix to be merged

/Thomas
