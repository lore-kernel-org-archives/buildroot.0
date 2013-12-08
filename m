From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 08 Dec 2013 21:31:40 +0100
Subject: [Buildroot] [PATCHv3 0/5] Add apache thrift
In-Reply-To: <1385989214-16956-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 2 Dec 2013 10:00:09 -0300")
References: <1385989214-16956-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87zjob9j9v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Add the apache thrift runtime and host tool.

 > Changes for v3:
 > * Install thrift to staging (d'oh!)
 > * Add a handy $(THRIFT) definition

I guess you're planning on adding packages using this THRIFT variable in
the future?

Committed series, thanks.

-- 
Bye, Peter Korsgaard
