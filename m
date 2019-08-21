From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Aug 2019 14:38:21 +0200
Subject: [Buildroot] [PATCH v2] qemu: fix host virtfs option
In-Reply-To: <20190801170924.22435-1-vincent.stehle@arm.com> ("Vincent
 =?utf-8?Q?Stehl=C3=A9=22's?= message of "Thu, 1 Aug 2019 19:09:24 +0200")
References: <20190801180239.262e5f6e@windsurf.home>
 <20190801170924.22435-1-vincent.stehle@arm.com>
Message-ID: <87ef1e66de.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vincent" == Vincent Stehl? <vincent.stehle@arm.com> writes:

 > Fix the build of host-qemu with virtfs enabled: fix a typo in makefile
 > conditional and add a dependency on host-libcap.

 > The virtfs configuration option was added by commit e0f49e648401
 > ("package/qemu: add option to enable virtual filesystem in host qemu").

 > Signed-off-by: Vincent Stehl? <vincent.stehle@arm.com>
 > Cc: Etienne Carriere <etienne.carriere@linaro.org>

 > ---
 > Changes v1 -> v2:
 >   - Forcibly disable virtfs when config option is =n rather than letting
 >     qemu auto-detect (as per Thomas' feedback)

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
