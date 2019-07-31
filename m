From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 31 Jul 2019 21:33:21 +0200
Subject: [Buildroot] [PATCH v2] ima-evm-utils: Add as new package,
 version 1.2.1
In-Reply-To: <20190731193119.10522-1-petr.vorel@gmail.com>
References: <20190731193119.10522-1-petr.vorel@gmail.com>
Message-ID: <20190731193320.GA10819@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Tested:

./utils/test-pkg -p ima-evm-utils
                             br-arm-full [1/6]: OK
                  br-arm-cortex-a9-glibc [2/6]: OK
                   br-arm-cortex-m4-full [3/6]: SKIPPED
                          br-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK

Kind regards,
Petr
