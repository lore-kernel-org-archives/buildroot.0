From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 16:38:29 +0100
Subject: [Buildroot] [PATCH 6/8] utils/check-package: allow to disable
 warning for a line
In-Reply-To: <20190127185943.1136-7-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Sun, 27 Jan 2019 16:59:41 -0200")
References: <20190127185943.1136-1-ricardo.martincoski@gmail.com>
 <20190127185943.1136-7-ricardo.martincoski@gmail.com>
Message-ID: <8736pb8oei.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > Currently any exceptions for a check function need to be coded into the
 > check-package script itself.

 > Create a pattern that can be used in a comment to make check-package
 > ignore one or more warning types in the line immediately below:
 >  # check-package Indent, VariableWithBraces

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
