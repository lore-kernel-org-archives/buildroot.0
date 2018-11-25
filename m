From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 22:31:54 +0100
Subject: [Buildroot] [PATCH] package/gcc: fix xtensa uclinux code
 generation
In-Reply-To: <20181107212050.32439-1-jcmvbkbc@gmail.com> (Max Filippov's
 message of "Wed, 7 Nov 2018 13:20:50 -0800")
References: <20181107212050.32439-1-jcmvbkbc@gmail.com>
Message-ID: <87o9ac3ktx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > xtensa-uclinux uses bFLT executable file format that cannot relocate
 > fields representing offsets from data to code. C++ objects built as PIC
 > use offsets to encode FDE structures. As a result C++ exception handling
 > doesn't work correctly on xtensa-uclinux. Don't use PIC by default on
 > xtensa-uclinux.

 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Committed to 2018.02.x (minus the 8.2.0 patch) and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
