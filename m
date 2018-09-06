From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Sep 2018 21:17:01 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain: add 4.18.x choice for headers
In-Reply-To: <20180906100534.6fe06c24@windsurf> (Thomas Petazzoni's message of
 "Thu, 6 Sep 2018 10:05:34 +0200")
References: <20180906074216.32688-1-jerome.forissier@linaro.org>
 <20180906100534.6fe06c24@windsurf>
Message-ID: <871sa68mhe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello J?r?me,
 > On Thu,  6 Sep 2018 09:42:16 +0200, Jerome Forissier wrote:
 >> Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
 >> ---
 >> toolchain/Config.in                                                  | 5 +++++
 >> .../toolchain-external/toolchain-external-custom/Config.in.options   | 4 ++++
 >> 2 files changed, 9 insertions(+)
 >> 
 >> FYI, this is needed in order to use the GCC 8.2.x recently published by
 >> Arm [1] as an external toolchain.
 >> 
 >> [1] https://developer.arm.com/open-source/gnu-toolchain/gnu-a/downloads

 > Thanks for this patch. In fact, we already have this in our "next"
 > branch:

 >   https://git.buildroot.org/buildroot/commit/toolchain?h=next&id=7f62d8122bc42b84608cad34fb005b4870c143d5

 > But we could indeed have it in the master branch, so that the most
 > recent toolchains can be used even with our upcoming 2018.08 release.

I've now cherry picked this commit for master.

-- 
Bye, Peter Korsgaard
