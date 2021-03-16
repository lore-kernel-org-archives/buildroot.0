From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Mar 2021 23:14:46 +0100
Subject: [Buildroot] [PATCH 1/2] package/asterisk: remove default -O3
 optimization flag
In-Reply-To: <20210305091102.2420944-2-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Fri, 5 Mar 2021 10:11:01 +0100")
References: <20210305091102.2420944-1-giulio.benetti@benettiengineering.com>
 <20210305091102.2420944-2-giulio.benetti@benettiengineering.com>
Message-ID: <87o8fiycdl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Actually asterisk package gets built with -O3 cflag since it's defaulted
 > into its sources, but it's not what we want, so let's empty its OPTIMIZE
 > Makefile variable letting Buildroot CFLAGS to take place instead.

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
