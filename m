From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 12 Mar 2013 08:38:42 +0100
Subject: [Buildroot] [PATCH 4/5] Enable ccache for cmake packages
In-Reply-To: <87620zyp50.fsf@dell.be.48ers.dk>
References: <1362590066-5448-1-git-send-email-luca@lucaceresoli.net>
 <1362590066-5448-5-git-send-email-luca@lucaceresoli.net>
 <CAHXCMMKpKo_jagngfJFDHPKfiMeUb3+zx5wZ++tg81OjwQ_8iA@mail.gmail.com>
 <87620zyp50.fsf@dell.be.48ers.dk>
Message-ID: <513EDB82.6080504@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:
>   Samuel> Hi Lucas,
>   Samuel> 2013/3/6 Luca Ceresoli <luca@lucaceresoli.net>:
>   >> CMake fails in detecting the compiler when ccache is used. Add a wrapper
>   >> script to make it happy.
>
>   Samuel> It is possible to do this without any wrapper, setting
>   Samuel> CMAKE_C_COMPILER and CMAKE_CXX_COMPILER to the ccache binary path, and
>   Samuel> CMAKE_C_COMPILER_ARG1 and CMAKE_CXX_COMPILER_ARG1 to the actual
>   Samuel> C-compiler, respectively to the C++-compiler.
>
>   Samuel> BTW, note that we currently don't handle space in the paths at all;
>   Samuel> hope that nobody triggers issues related to this ;)
>
> Luca, could you respin the patch to do this instead?
>

Sure, will do.

Luca
