From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Mar 2013 21:29:47 +0100
Subject: [Buildroot] [PATCH 4/5] Enable ccache for cmake packages
In-Reply-To: <CAHXCMMKpKo_jagngfJFDHPKfiMeUb3+zx5wZ++tg81OjwQ_8iA@mail.gmail.com>
 (Samuel Martin's message of "Wed, 6 Mar 2013 20:02:02 +0100")
References: <1362590066-5448-1-git-send-email-luca@lucaceresoli.net>
 <1362590066-5448-5-git-send-email-luca@lucaceresoli.net>
 <CAHXCMMKpKo_jagngfJFDHPKfiMeUb3+zx5wZ++tg81OjwQ_8iA@mail.gmail.com>
Message-ID: <87620zyp50.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> Hi Lucas,
 Samuel> 2013/3/6 Luca Ceresoli <luca@lucaceresoli.net>:
 >> CMake fails in detecting the compiler when ccache is used. Add a wrapper
 >> script to make it happy.

 Samuel> It is possible to do this without any wrapper, setting
 Samuel> CMAKE_C_COMPILER and CMAKE_CXX_COMPILER to the ccache binary path, and
 Samuel> CMAKE_C_COMPILER_ARG1 and CMAKE_CXX_COMPILER_ARG1 to the actual
 Samuel> C-compiler, respectively to the C++-compiler.

 Samuel> BTW, note that we currently don't handle space in the paths at all;
 Samuel> hope that nobody triggers issues related to this ;)

Luca, could you respin the patch to do this instead?

-- 
Bye, Peter Korsgaard
