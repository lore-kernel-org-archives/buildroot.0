From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 16:39:16 +0100
Subject: [Buildroot] [PATCH 7/8] utils/check-package: handle
 ifdef/ifndef in .mk files
In-Reply-To: <20190127185943.1136-8-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Sun, 27 Jan 2019 16:59:42 -0200")
References: <20190127185943.1136-1-ricardo.martincoski@gmail.com>
 <20190127185943.1136-8-ricardo.martincoski@gmail.com>
Message-ID: <87y37379sr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > Currently check-package only knows about ifeq/ifneq.
 > Add code to handle ifdef/ifndef as well.

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
