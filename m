From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 03 Feb 2010 11:50:10 +0100
Subject: [Buildroot] How to bild the android with buildroot
In-Reply-To: <77d79b081002022353n512ba2bbsa4b148f96c3e181@mail.gmail.com>
	(=?utf-8?B?IuybkOyaqeykgCIncw==?= message of "Wed, 3 Feb 2010 16:53:16
	+0900")
References: <77d79b081002022353n512ba2bbsa4b148f96c3e181@mail.gmail.com>
Message-ID: <87fx5isie5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "???" == ???  <uhanraks@gmail.com> writes:

 ???> Hello.
 ???> I am mailing to ask a question about android(Google).

 ???> I would like to execute the [andriod] build in [buildroot].
 ???> Could you let me know the information related to [andriod] build
 ???> or how I can execute it.
 ???> If you have no idea about it, could you tell me the way to execute the
 ???> build seperating source and environment configuration.

We have no android support in buildroot.

Android requires kernel patches and a completely different userland.

-- 
Bye, Peter Korsgaard
