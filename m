From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Mar 2019 09:03:54 +0100
Subject: [Buildroot] [PATCH v2] package/qt5base: fix xkbcommon option
In-Reply-To: <20190321220044.26676-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Thu, 21 Mar 2019 23:00:44 +0100")
References: <20190321220044.26676-1-ps.report@gmx.net>
Message-ID: <87mulkbswl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > - Qt 5.6: according to configure --help the command line option to
 >   enable x11 xkbcommon support is '-system-xkbcommon-x11'

 > - Qt 5.12: according to configure --help the command line option to
 >   enable xkbcommon support is '-xkbcommon'

 > Fixes [1]:

 >   ERROR: Invalid value given for boolean command line option 'xkbcommon'.

 > [1] http://autobuild.buildroot.net/results/87076d03bb92a9940447ca80fc1f202e35ef39da

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 > Changes v1 -> v2:
 >   - remove duplicates of the -xcb option (spotted by Yann E. MORIN)

Committed, thanks.

-- 
Bye, Peter Korsgaard
