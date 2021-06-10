From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 22:16:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/odb: fix build with gcc 11
In-Reply-To: <20210603200901.375386-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 3 Jun 2021 22:09:01 +0200")
References: <20210603200901.375386-1-fontaine.fabrice@gmail.com>
Message-ID: <87h7i5iigc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Add -std=c++11 to fix the following build failure with gcc 11:
 > /data/buildroot-autobuilder/instance-0/output-1/host/include/cutl/shared-ptr/base.hxx:34:41: error: ISO C++17 does not allow dynamic exception specifications
 >    34 | operator new (std::size_t, cutl::share) throw (std::bad_alloc);
 >       |                                         ^~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/9cbb8be7a1d8ac5913fbc5e2a78c4c45b5daf8e2

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
