From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Apr 2021 13:34:40 +0200
Subject: [Buildroot] [PATCH] package/pkg-kconfig: fix error string
In-Reply-To: <20210329224154.3716438-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Tue, 30 Mar 2021 00:41:54 +0200")
References: <20210329224154.3716438-1-giulio.benetti@benettiengineering.com>
Message-ID: <87czvb61pr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Current error string speaks only about "fragment" but here we also deal
 > with Kconfig files, so let's add "file or fragment" instead of "fragment".

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
