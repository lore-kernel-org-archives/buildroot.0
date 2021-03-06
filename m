From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 06 Mar 2021 11:20:31 +0100
Subject: [Buildroot] [PATCH] package/libgeos: disable package while
 building for Nios II
In-Reply-To: <20210305160005.3826615-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Fri, 5 Mar 2021 17:00:05 +0100")
References: <20210305160005.3826615-1-giulio.benetti@benettiengineering.com>
Message-ID: <87eegsa8i8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > This package fails to build with Nios II up to gcc version 10.x and no
 > work around has been found. So let's disable it whil building for Nios
 > II.

 > Fixes:
 > http://autobuild.buildroot.net/results/a05fdf1958f93a206c5c66c7f636b6650683626d
 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
