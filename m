From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 15:10:34 +0100
Subject: [Buildroot] Putting qtwebkit on a diet
In-Reply-To: <f7391a80-8158-7b15-b1ef-d6386982f426@petroprogram.com>
References: <7f8d2d60-b870-61f1-df5e-ed83f9923c39@petroprogram.com>
 <56abbedc-c97e-46e6-5458-7b6c2b18ba18@petroprogram.com>
 <20171130090230.79cedfe7@windsurf.home>
 <f7391a80-8158-7b15-b1ef-d6386982f426@petroprogram.com>
Message-ID: <20171201151034.44c460b3@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 1 Dec 2017 16:05:03 +0200, Stefan Fr?berg wrote:

> It get's even better. When enabling "optimize for size" feature and ARM
> thumb2 (needed for optimize size on ARM platforms)
> I could reduce QtWebkit size down to 7.6 MB ! :-)
> 
> I try to collect as many feature settings that I can find and then make
> patch serie of 3 where:
> - patch #1 let's user to disable/enable features individually
> - patch #2 introduces quick setting, minimal to disable all features
> leaving only the core of the webkit (enough for surfing? need to test)

OK. I'm not sure yet about patch #2, but I'll have to see the code to
really decide.

> - patch #3 exposes that optimize size feature

Is it just -Os ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
