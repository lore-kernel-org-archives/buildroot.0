From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Mar 2020 20:12:27 +0100
Subject: [Buildroot] [PATCH v1] package/qt5base: fix double-conversion
 compile for nios2
In-Reply-To: <20200308171804.19615-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sun, 8 Mar 2020 18:18:04 +0100")
References: <20200308171804.19615-1-ps.report@gmx.net>
Message-ID: <8736aiu0dg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Add double-conversion upstream patch to enable compile for nios2.
 > Fixes:

 >   http://autobuild.buildroot.net/results/19881951a328ff4df82b5753a23219eb634e86df

 >   ../3rdparty/double-conversion/include/double-conversion/utils.h:114:2: error: #error Target architecture was not detected as supported by Double-Conversion.

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
