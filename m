From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 26 Nov 2011 14:30:58 +0100
Subject: [Buildroot] [PATCH 1/2] ruby: fix build breakage
In-Reply-To: <1322220912-20268-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 25 Nov 2011 08:35:11 -0300")
References: <1322220912-20268-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87zkfjhuy5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Fix build breakage regarding invalid file format of
 Gustavo> /usr/lib/libpthread.so
 Gustavo> This is because ruby has rpath enabled by default and was throwing in
 Gustavo> the runtime paths and pulling in host libraries into the mix.
 Gustavo> So disable rpath.

Committed both, thanks.

-- 
Bye, Peter Korsgaard
