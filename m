From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Jan 2018 22:52:30 +0100
Subject: [Buildroot] [PATCH v2,1/1] flatbuffers: new package
In-Reply-To: <20171218211039.4450-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 18 Dec 2017 22:10:39 +0100")
References: <20171218211039.4450-1-fontaine.fabrice@gmail.com>
Message-ID: <87tvvmssbl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > FlatBuffers is an efficient cross platform serialization
 > library for C++, C#, C, Go, Java, JavaScript, PHP, and
 > Python. It was originally created at Google for game
 > development and other performance-critical applications.

 > http://google.github.io/flatbuffers/

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Thomas Petazzoni and reading of
 > https://patchwork.ozlabs.org/patch/814900):
 >  - Fix DEVELOPERS entry
 >  - Add dependencies on BR2_INSTALL_LIBSTDCPP and
 >  BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 >  - Set FLATBUFFERS_BUILD_SHAREDLIB depending on BR2_STATIC_LIBS instead
 >  of using BR2_SHARED_LIBS and BR2_SHARED_STATIC_LIBS
 >  - Add -DCMAKE_CXX_FLAGS="-std=c++11"

Committed, thanks.

-- 
Bye, Peter Korsgaard
