From: Charles Krinke <charles.krinke@gmail.com>
Date: Sun, 27 Jan 2013 12:31:55 -0800
Subject: [Buildroot] decreasing size of compile log
Message-ID: <CALo-6+jBObEiK5reN1qno0bD-ufDK3jX2drKbcwzKLXt=A9reQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gentlemen:

I have a nearly finished AM3517 project with buildroot. Thank you all
for getting me to this point.

I have an issue where the compile log runs 50000 lines. That is, "make
clean && make" produces output from all the packages being compiled.

Is there a way to add a string to selected buildroot/package
directories to tell selected packages to either not print their
compiled output, send it do /dev/null or minimize the printed output
during compile so as to focus on the one or two packages where there
are issues to be solved?

-- 
Charles Krinke
