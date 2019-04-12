From: Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Fri, 12 Apr 2019 22:15:17 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2019-04-11
In-Reply-To: <5cb02982.1c69fb81.f3887.2c53SMTPIN_ADDED_MISSING@mx.google.com>
References: <5cb02982.1c69fb81.f3887.2c53SMTPIN_ADDED_MISSING@mx.google.com>
Message-ID: <e49bfd0c-270c-77fb-0b18-04722b971c41@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> Results for the 'master' branch
> ===============================
>
> Build failures related to your packages:
>
>          i586 |                host-llvm-8.0.0 | http://autobuild.buildroot.net/results/0c046a1b57a4f0b992333003d41062e1b256eb0d

Should we require gcc 5.1 or do we add LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN
and wait until next version ?

-- Detecting CXX compile features - done
CMake Error at cmake/modules/CheckCompilerVersion.cmake:40 (message):
   Host GCC version should be at least 5.1 because LLVM will soon use new C++
   features which your toolchain version doesn't support.  Your version is
   4.8.2.  You can temporarily opt out using
   LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN, but very soon your toolchain won't be
   supported.
Call Stack (most recent call first):
   cmake/modules/CheckCompilerVersion.cmake:45 (check_compiler_version)
   cmake/config-ix.cmake:13 (include)
   CMakeLists.txt:590 (include)

Best regards,

Valentin

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190412/67246fc1/attachment.html>
