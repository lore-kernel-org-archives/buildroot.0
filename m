From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 22:14:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/dc3dd: disable on riscv32
In-Reply-To: <20210604184706.5069-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 4 Jun 2021 20:47:06 +0200")
References: <20210604184706.5069-1-fontaine.fabrice@gmail.com>
Message-ID: <87pmwtiik7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Disable dc3dd on riscv32 to avoid the following build failure:
 > In file included from getdate.y:40:
 > verify.h:132:30: error: negative width in bit-field 'verify_error_if_negative_size__'
 >   132 |       (struct { unsigned int verify_error_if_negative_size__: (R) ? 1 : -1; }))
 >       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/267151dec9d2328a5f8c61ddf224219a4f617e5c

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
