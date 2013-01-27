From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 27 Jan 2013 23:37:05 +0100
Subject: [Buildroot] decreasing size of compile log
In-Reply-To: <CALo-6+jaZx+NE3bbU3E9M8jxuQw9CEOjX+i-qt2=Hn0s2p6Hnw@mail.gmail.com>
 (Charles Krinke's message of "Sun, 27 Jan 2013 13:49:17 -0800")
References: <CALo-6+jBObEiK5reN1qno0bD-ufDK3jX2drKbcwzKLXt=A9reQ@mail.gmail.com>
 <87a9rubboh.fsf@dell.be.48ers.dk>
 <CALo-6+jaZx+NE3bbU3E9M8jxuQw9CEOjX+i-qt2=Hn0s2p6Hnw@mail.gmail.com>
Message-ID: <87y5fe9rse.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Charles" == Charles Krinke <charles.krinke@gmail.com> writes:

 Charles> The key issue seems to be the web page that tracks builds for every
 Charles> checkin. The 50000 lines of log takes "almost forever" to load on most
 Charles> browsers and "forever" on the browsers that get indigestion and crash
 Charles> loading the page.

 Charles> So, ... at this point in the project, I am only interested in build
 Charles> failures which only occur when a checkin from someone goes "awry".

 Charles> The "-s" argument, is this an argument to make? As in, "make -s"

Yes. From man make:

      -s, --silent, --quiet
            Silent operation; do not print the commands as they are executed.

-- 
Bye, Peter Korsgaard
