From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Sep 2015 00:03:25 +0200
Subject: [Buildroot] [PATCHv2] micropython: new package
In-Reply-To: <55F7EF95.30001@imgtec.com>
References: <1442226102-15878-1-git-send-email-judge.packham@gmail.com>
 <1442275305-10690-1-git-send-email-judge.packham@gmail.com>
 <55F7EF95.30001@imgtec.com>
Message-ID: <20150916000325.5be2a54e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, Chris,

On Tue, 15 Sep 2015 11:14:45 +0100, Vicente Olivert Riera wrote:

> As Thomas suggested, improve that by listing the licenses. According to
> the LICENSE file, everything is MIT unless the setup.py of each module
> says something different, so I have done a quick check:
> 
> $ find micropython-lib-v0.5/ -type f -name "setup.py" -exec grep license
> {} \; | sort -u
>       license='MIT',
>       license='Python',
> 
> So I think it would be enough by just having:
> 
> MICROPYTHON_LIB_LICENSE = Python (some modules), MIT (everything else)
> 
> Thomas, what do you think?

I haven't checked micropython source code myself, but what you propose
looks sensible, to the exception that "Python" isn't a license. The
license of Python is "Python software foundation license v2".

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
