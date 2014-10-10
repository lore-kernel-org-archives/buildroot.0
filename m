From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Oct 2014 20:59:35 +0200
Subject: [Buildroot] Perl libraries/modules sub-menu is empty
In-Reply-To: <CAP6ETiSDXeQJhUG5b4o37HoesirmzYUncWLTghn0G5TUJ-TA-Q@mail.gmail.com>
References: <CAP6ETiSDXeQJhUG5b4o37HoesirmzYUncWLTghn0G5TUJ-TA-Q@mail.gmail.com>
Message-ID: <20141010205935.28abfebb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Pedro Silva,

On Fri, 10 Oct 2014 15:43:57 +0100, Pedro Silva wrote:

> I am trying to add "mosh" (mobile shell) to buildroot but it is missing
> some perl modules, namely the socket module...
> ? The error is: ?Can't locate Socket.pm in @INC (you may need to install
> the Socket module)?.
> 
> ?The problem is that in buildroot, with perl package checked ("Interpreter
> languages and scripting"), the ?"Perl libraries/modules" is empty and cause
> of that I am not able to select any additional module.
> ?Any hint on this issue??

You're using Buildroot 2014.05, and back in this version, there were no
target Perl modules packaged in Buildroot. They started to appear in
Buildroot 2014.08.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
