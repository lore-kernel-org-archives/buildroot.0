From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 13 Dec 2012 14:19:37 +0100
Subject: [Buildroot] Boost builds failed
In-Reply-To: <673DDE2D-005B-43FD-A21B-B84568013166@gmail.com> (Victor
 Hiairrassary's message of "Thu, 13 Dec 2012 11:40:32 +0100")
References: <673DDE2D-005B-43FD-A21B-B84568013166@gmail.com>
Message-ID: <87pq2eks2e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Victor" == Victor Hiairrassary <victor.hiairrassary.ml@gmail.com> writes:

 Victor> During  some auto builds,  boost failed to compiles  because on
 Victor> .config file,  only boost is selected, and  no boost library is
 Victor> selected, like thread regex,etc.

I haven't looked at the boost build system, but it should either always
build something or simply skip the build/install steps (E.G. become a
noop) if none of the libraries are enabled.

-- 
Bye, Peter Korsgaard
