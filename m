From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 9 Oct 2014 12:35:38 +0200
Subject: [Buildroot] Problems with uClicbc and libc.so.6
Message-ID: <CA+TH9VnNeLUgYs5yahr3FNz6+bcz8A_KR_6390kcWUXv7LVxOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi List,

I'm having hard times with some software packages I'm adding to
buildroot. When choosing uClibc, libc.so.6 is missing, so a lot of
software doesn't work.

Right now I'm mostly working on my mono package, it works well with
glibc, but when compiled with uClibc, this is the error:

Unhandled Exception:
System.Net.WebException: An error occurred performing a WebClient
request. ---> System.DllNotFoundException: libc.so.6

Clearly, making a soft link between libc.so.0 and libc.so.6 makes
things working again. I'm on the master git branch.

Any hint appreciated.

Thanks!

-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
