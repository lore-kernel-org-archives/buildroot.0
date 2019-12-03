From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Dec 2019 08:11:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/cmocka: fix build on riscv64
In-Reply-To: <CA+1k=2b+1WmbKM7QzKPPwM2RpWdD==4GBsmNUmGqjAP=WqZRTA@mail.gmail.com>
 (Joel Carlson's message of "Mon, 2 Dec 2019 14:08:11 -0700")
References: <20191119180259.401332-1-fontaine.fabrice@gmail.com>
 <CA+1k=2b+1WmbKM7QzKPPwM2RpWdD==4GBsmNUmGqjAP=WqZRTA@mail.gmail.com>
Message-ID: <87tv6hq3wx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joel" == Joel Carlson <JoelsonCarl@gmail.com> writes:

 > Hello,
 > On Tue, Nov 19, 2019 at 11:02 AM Fabrice Fontaine
 > <fontaine.fabrice@gmail.com> wrote:
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/30922c18150ea62aefe123d1b7cd1444efab963f
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 > [snip]

 > Reviewed-by: Joel Carlson <JoelsonCarl@gmail.com>
 > Tested-by: Joel Carlson <JoelsonCarl@gmail.com>

 > Tested to make sure it fixed the build issue on riscv64, and then used
 > test-pkg -a to make sure all other architectures still compiled cmocka
 > successfully.

Committed, thanks.

-- 
Bye, Peter Korsgaard
