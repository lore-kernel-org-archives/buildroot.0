From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jul 2014 21:29:33 +0200
Subject: [Buildroot] fakeroot patch
In-Reply-To: <CAMai9+osi=SQp74yhL3qfdsJWawVzZy517aZdw6V67q9sytEOw@mail.gmail.com>
 (Jeff Bailey's message of "Thu, 10 Jul 2014 19:21:39 +0000")
References: <CAMai9+qVrXKNEoC-7=aR+s09ytt-MEQaXQiAEpsE_g1voWHA3A@mail.gmail.com>
 <877g3lni3o.fsf@dell.be.48ers.dk>
 <CAMai9+osi=SQp74yhL3qfdsJWawVzZy517aZdw6V67q9sytEOw@mail.gmail.com>
Message-ID: <8738e9nhb6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jeff" == Jeff Bailey <jeffbailey@google.com> writes:

 > Correct. ?While most of our builds happen on x86 targeting ppc64le, when doing
 > development I use the ppc64le system natively to speed up build/test
 > iterations.

Ok, and you still use Buildroot for that? Buildroot is really a system for cross
compilation. Do you do ppc64le->ppc64le cross compilation? How does that
speed up development?

-- 
Bye, Peter Korsgaard 
