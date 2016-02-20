From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 18:31:50 +0100
Subject: [Buildroot] [PATCH v5 19/20] python-autobahn: new package
In-Reply-To: <CAGm1_ksj0CetgAFvrnRty5Tz+wRX77XxOZ_VFKvFn1na=D58Kg@mail.gmail.com>
References: <1455188328-7595-1-git-send-email-mc5686@mclink.it>
 <1455188328-7595-2-git-send-email-mc5686@mclink.it>
 <20160220150553.1da70aab@free-electrons.com>
 <CAGm1_ksj0CetgAFvrnRty5Tz+wRX77XxOZ_VFKvFn1na=D58Kg@mail.gmail.com>
Message-ID: <20160220183150.0c2d7af8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Feb 2016 16:53:36 +0100, Yegor Yefremov wrote:

> Try to compile autobahn with PYC only and twisted and
> python-pynacl-1.0.1 enabled. I get:

OK. This should have been mentioned in the commit log, and if
python-pynacl and twisted are optional dependencies of python-autobahn,
which affect its build process, then they should be handled as such.

Can you submit follow-up patches ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
