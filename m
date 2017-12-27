From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 23:25:45 +0100
Subject: [Buildroot] [PATCH v2 1/2] python-cffi: add missing runtime
 dependency
In-Reply-To: <20171218080705.3182-1-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Mon, 18 Dec 2017 09:07:04
 +0100")
References: <20171218080705.3182-1-yegorslists@googlemail.com>
Message-ID: <877et7q046.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > python-pycparser is mentioned in setup.py as install_requires, so
 > select it in Config.in.

 > As python-cffi will be installed with python-crossbar's dependencies,
 > remove it from python-crossbar's Config.in.

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 > ---
 > Changes v1 -> v2:
 > 	- rename patch to just indicate that we are adding missing runtime dependency

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
