From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 22:41:17 +0200
Subject: [Buildroot] [PATCH v2 2/6] testing/tests/package/test_python:
 refactor TestPythonBase
In-Reply-To: <20170712024009.2366-3-andrew.smirnov@gmail.com>
References: <20170712024009.2366-1-andrew.smirnov@gmail.com>
 <20170712024009.2366-3-andrew.smirnov@gmail.com>
Message-ID: <20170722224117.4736a00e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Jul 2017 19:40:05 -0700, Andrey Smirnov wrote:
> Convert TestPythonBase to a true base class that only provides code
> implementing various tests without definig tests themselves in a
> "discoverable" form.
> 
> To retain correct testing functionality, add TestPython2 derived class
> that uses code from TestPythonBase to define actual runnable test.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  support/testing/tests/package/test_python.py | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)

Applied to master, after fixing the two issues pointed by Ricardo.

BTW Ricardo: you seem to be following the changes on the test
infrastructure, and contributing to it. Would you be willing to be
listed in DEVELOPERS for this support/testing/ folder ? Your review and
testing of the testing infrastructure patches are definitely very
useful.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
