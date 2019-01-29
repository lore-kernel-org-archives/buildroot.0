From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 23:01:37 +0100
Subject: [Buildroot] [PATCH 5/8] package/usb_modeswitch: avoid
 overriding variables
In-Reply-To: <20190127185943.1136-6-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Sun, 27 Jan 2019 16:59:40 -0200")
References: <20190127185943.1136-1-ricardo.martincoski@gmail.com>
 <20190127185943.1136-6-ricardo.martincoski@gmail.com>
Message-ID: <87k1in2ke6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > Overriding variables in packages recipes is an error-prone practice.
 > Current behavior of installing either only as a script or only as a
 > binary is intended, as describe in the commit log of "d3e4db4e34
 > usb_modeswitch: bump to version 1.2.6" from 2013.

 > Rewrite the code to keep the same behavior while replacing variable
 > override [1] by conditional assignments [2].

 > [1]
 > VAR = ...
 > if ...
 > VAR = ...

 > [2]
 > if ...
 > VAR = ...
 > else
 > VAR = ...

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
