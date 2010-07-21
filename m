From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 21 Jul 2010 19:02:31 -0300
Subject: [Buildroot] AVR32 is broken (toolchain)
Message-ID: <AANLkTinBXtX-xDYtM5V8pTrwNpkDKBHSpz9MKnQ8mypa@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

     I was able to track it down to this commit:
8e8103bfb55a814d68eabb51afebfb35c3e7cec8
     The toolchain builds right before it, but doesn't after.
     I'm trying to figure it out, but I'm not very experienced with
the toolchain build or git, so it's taking me quite a while. Perhaps
someone with more experience could take a look at the issue?

     It's reproductible with make atngw100_defconfig

Kind Regards,
     Thiago A. Correa
