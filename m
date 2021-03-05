From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri,  5 Mar 2021 10:11:00 +0100
Subject: [Buildroot] [PATCH 0/2] package/asterisk: fix gcc bug 93847
Message-ID: <20210305091102.2420944-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

First patch needs to allow Buildroot to build with its CFLAGS instead of
Asterisk hardcoded one, while the second applies the gcc bug work-around.

Giulio Benetti (2):
  package/asterisk: remove default -O3 optimization flag
  package/asterisk: fix build failure due to gcc bug 93847

 package/asterisk/asterisk.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

-- 
2.25.1
