From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 06 May 2013 13:27:41 +0200
Subject: [Buildroot] [PATCH 3/3] python-serial: fix shebang
In-Reply-To: <51878F3D.9020102@zacarias.com.ar> (Gustavo Zacarias's message of
 "Mon, 06 May 2013 08:08:45 -0300")
References: <1365872210-20167-1-git-send-email-gustavo@zacarias.com.ar>
 <1365872210-20167-3-git-send-email-gustavo@zacarias.com.ar>
 <871u9klfw3.fsf@dell.be.48ers.dk> <51878F3D.9020102@zacarias.com.ar>
Message-ID: <87obcojqky.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> On 05/06/2013 04:35 AM, Peter Korsgaard wrote:
 >> I see we have the same issue with usr/bin/smtpd.py from python itself,
 >> but I'm not sure how to fix that (besides running sed after
 >> installation).
 >> 
 >> Any idea?

 Gustavo> Some (all?) distributions just remove it, it's a smtp proxy,
 Gustavo> kind of a sample program, not something we want lingering on
 Gustavo> the target filesystem

Ok, thanks. Care to send a patch doing that?

-- 
Bye, Peter Korsgaard
