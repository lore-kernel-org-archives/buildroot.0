From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Apr 2015 23:31:00 +0200
Subject: [Buildroot] Versioned symbols in elfutils and uClibc
In-Reply-To: <CAMo8BfLEk0C7pv2DY1eOr-aqHzaPf0wNNn8aNhdAhsT-CB4eWQ@mail.gmail.com>
 (Max Filippov's message of "Tue, 21 Apr 2015 20:59:06 +0300")
References: <CAMo8BfLHuMzBaETgnJu-O+osAKw3dQM-XCUa5yEqP__oZwwQFw@mail.gmail.com>
 <87a8y1u32q.fsf@dell.be.48ers.dk>
 <CAMo8BfLEk0C7pv2DY1eOr-aqHzaPf0wNNn8aNhdAhsT-CB4eWQ@mail.gmail.com>
Message-ID: <87k2x5rwx7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

Hi,

>> Without knowing much about this, have you tried commenting out the
 >> #ifdef SHARED part in lib/eu-config.h (and possible the corresponding
 >> part in libdwfl/dwfl_report_elf.c)?

 > It does help, thanks. Looks like this place needs to be patched to
 > account for missing symbol versioning in uclibc?

Yes, it looks like it. Please consider submitting such patches to
elfutils upstream.

-- 
Bye, Peter Korsgaard 
