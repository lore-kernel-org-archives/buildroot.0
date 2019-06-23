From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 21:20:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-golang: add cflags/ldflags
 to GO_HOST_ENV
In-Reply-To: <20190603092101.8658-1-mirza.krak@northern.tech> (Mirza Krak's
 message of "Mon, 3 Jun 2019 11:21:01 +0200")
References: <20190603092101.8658-1-mirza.krak@northern.tech>
Message-ID: <87d0j4ds7x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mirza" == Mirza Krak <mirza.krak@northern.tech> writes:

 > If a go host package is built using cgo, it needs access
 > to HOST_CFLAGS/HOST_LDFLAGS to utilize host packages it
 > might depend on.

 > Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
 > ---

 > This fixes current build errors of mender-artifact-3.0.0:

 > http://autobuild.buildroot.net/results/dd1a6dac03dd3b68ee63761c33dbb01c328d4f14/build-end.log

Committed to 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
