From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Jun 2018 23:52:59 +0200
Subject: [Buildroot] [PATCH 1/1] gnuradio: bump to version 3.7.13.3
In-Reply-To: <20180624201234.10720-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 24 Jun 2018 22:12:34 +0200")
References: <20180624201234.10720-1-fontaine.fabrice@gmail.com>
Message-ID: <87o9fzets4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - This bump to 3.7.13.x fixes build with boost 1.67
 > - Remove patch (not needed as boost unit_test_framework has been
 >   removed since
 >   https://github.com/gnuradio/volk/commit/6dda1a1e9545d24a1c6f0b2a5d4b5d018fdcbff9)
 > - Add host-python-mako and host-python-six dependencies
 > - Add hash for license file

 > Fixes:
 >  - http://autobuild.buildroot.net/results/ca3b01a13cb0c580266aae5f3673b2c0a19ac6a4

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
