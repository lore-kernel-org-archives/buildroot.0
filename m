From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 May 2009 13:29:30 +0200
Subject: [Buildroot] Problem with LZO package in ARM configuration,
	need help to solve the problem
In-Reply-To: <49FEC5F7.9070808@free.fr> (Cyril HAENEL's message of "Mon\,
	04 May 2009 12\:39\:51 +0200")
References: <49FEC5F7.9070808@free.fr>
Message-ID: <877i0x6r8l.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Cyril" == Cyril HAENEL <chaenel@free.fr> writes:

Hi,

 Cyril> Any idea from where the problem can come from ?

Not right away...

 Cyril> I maybe have an idea : why does the script use arm-linux-g++ compiler
 Cyril> and not the complete path to the previously built arm compiler
 Cyril> toolchain ?
 Cyril> Because in fact it seems the configure script uses the arm-linux-g++
 Cyril> compiler _installed_ _on_  _my_ _machine_ !! But this compiler is and
 Cyril> old version (gcc3.4) and has nothing to do with buildroot normally
 Cyril> !!??

Ok, quick test - Rename the old compiler to arm-linux-g++-old and try
again - Does it still hang?

-- 
Bye, Peter Korsgaard
