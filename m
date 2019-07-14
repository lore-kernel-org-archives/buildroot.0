From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Jul 2019 13:02:47 +0200
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump to version 5.2
In-Reply-To: <20190709213552.22551-1-sergei.sakhno@gmail.com> (Serhii Sakhno's
 message of "Wed, 10 Jul 2019 00:35:52 +0300")
References: <20190709213552.22551-1-sergei.sakhno@gmail.com>
Message-ID: <87k1ck5160.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Serhii" == Serhii Sakhno <sergei.sakhno@gmail.com> writes:

 > Signed-off-by: Serhii Sakhno <sergei.sakhno@gmail.com>
 > ---
 >  linux/Config.in                                          | 4 ++--
 >  linux/linux.hash                                         | 1 +
 >  package/linux-headers/Config.in.host                     | 9 +++++++++
 >  toolchain/Config.in                                      | 5 +++++
 >  .../toolchain-external-custom/Config.in.options          | 4 ++++
 >  5 files changed, 21 insertions(+), 2 deletions(-)

Committed after changing the default kernel headers to 5.2, thanks.

-- 
Bye, Peter Korsgaard
