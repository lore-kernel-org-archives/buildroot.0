From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 11:29:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/libupnp18: fix static linking
 with mpd
In-Reply-To: <20190208204656.27400-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 8 Feb 2019 21:46:56 +0100")
References: <20190208204656.27400-1-fontaine.fabrice@gmail.com>
Message-ID: <87ftshtox3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Add a call to PKG_CHECK_MODULES in configure.ac to get openssl
 >   libraries and its dependencies if openssl support is enabled
 > - Add OPENSSL_LIBS to libupnp.pc.in so that applications linking with
 >   pupnp (such as mpd) will be able to retrieve openssl libraries

 > Fixes:
 >  - http://autobuild.buildroot.org/results/a4148e516070b79816769f3443fc24d6d8192073

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
