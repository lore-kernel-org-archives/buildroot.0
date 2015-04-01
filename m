From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Wed, 1 Apr 2015 09:28:12 -0500
Subject: [Buildroot] [PATCH 1/1] jamvm: add depends on toolchain
	w/threads
In-Reply-To: <CANQCQpaJObqR6poUyh5FMm58vPFGyruJm=JBWBbQtPgsP8pf1g@mail.gmail.com>
References: <1427385280-63133-1-git-send-email-matthew.weber@rockwellcollins.com>
 <CAMQcK5KRF47ZyTyzfj1e+xcDO0V_J8oUUXEgUiqF3zR6VYv7Qw@mail.gmail.com>
 <CANQCQpaJObqR6poUyh5FMm58vPFGyruJm=JBWBbQtPgsP8pf1g@mail.gmail.com>
Message-ID: <CAMQcK5Lsur2cCryZ=fTGeeWRQzwCtaErkP-Of9auJ+-s6cHkEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt,

On Thu, Mar 26, 2015 at 1:52 PM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> While running an autobuilder internally.  It's a arm uclibc build
> failure looking for pthreads.

I am curious about the Buildroot autobuilders then if they don't have
javac available on them to build.

Thomas - are there autobuilders that have javac installed on them?

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
