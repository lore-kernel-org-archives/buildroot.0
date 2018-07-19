From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 12:14:30 +0200
Subject: [Buildroot] [PATCH 1/1] support/dependencies/dependencies.sh:
In-Reply-To: <20180702123820.32222-1-david.degrave@mind.be> (David De Grave's
 message of "Mon, 2 Jul 2018 14:38:20 +0200")
References: <20180702123820.32222-1-david.degrave@mind.be>
Message-ID: <878t67edmh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "David" == David De Grave (Essensium/Mind) <david.degrave@mind.be> writes:

 > Add the i686 package list to install when using pre-built 32 bits binaries with
 > a redhat/fedora host distribution (glibc.i686 and zlib.i686).

 > Signed-off-by: David De Grave (Essensium/Mind) <david.degrave@mind.be>
 > ---
 > Remark: The 32 bits libraries are already included in the gcc package contrary
 >         to debian where additionnal packages are needed. So it's not needed to
 >         do something similar for BR2_HOSTARCH_NEEDS_IA32_COMPILER.

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
