From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Oct 2019 10:34:09 +0100
Subject: [Buildroot] [PATCH v1] package/icu: fix double conversion
 compile for microblaze
In-Reply-To: <20191003145806.22848-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Thu, 3 Oct 2019 16:58:06 +0200")
References: <20191003145806.22848-1-ps.report@gmx.net>
Message-ID: <87lft58b8u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Fixes [1]:
 >   In file included from double-conversion.h:42:0,
 >                    from number_decimalquantity.cpp:19:
 >   double-conversion-utils.h:120:2: error: #error Target architecture was not detected as supported by Double-Conversion.
 >    #error Target architecture was not detected as supported by Double-Conversion.

 > Apply the same fix as previously for qt5base ([2], already sent upstream [3],
 > but seems to be lost while merging [4]).

 > [1] http://autobuild.buildroot.net/results/24005bc54cbc742decee221fb09bca19ee70502c
 > [2] https://git.buildroot.net/buildroot/commit/?id=530668ddb709cf27aa6694e00f44cf58af858b0b
 > [3] https://github.com/google/double-conversion/issues/73
 > [4] https://github.com/google/double-conversion/commit/768a445f0c28311bf88685bf0bb990505c12fd4c

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
