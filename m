From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 17:24:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/mongodb: disable on powerpc64
In-Reply-To: <20190309211236.15682-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 9 Mar 2019 22:12:36 +0100")
References: <20190309211236.15682-1-fontaine.fabrice@gmail.com>
Message-ID: <87y352ncqd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > As stated in SConstruct, the altivec runtime test breaks
 > cross-compilation: "This checks for an altivec optimization we use in
 > full text search. Different versions of gcc appear to put output bytes
 > in different parts of the output vector produced by vec_vbpermq.  This
 > configure check looks to see which format the compiler produces. NOTE:
 > This breaks cross compiles, as it relies on checking runtime
 > functionality for the environment we're in."

 > Fixes:
 >  - http://autobuild.buildroot.org/results/162198617979a83b66f70ed6013251942ed04d67

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
