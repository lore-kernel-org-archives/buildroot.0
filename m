From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Jun 2012 09:51:02 +0200
Subject: [Buildroot] [PATCH] jpeg-turbo: new package
In-Reply-To: <CA+pfegFoEQB_=byD-fyvZt_0SJYy5Dtu5dhATDh29ay66Fk6tg@mail.gmail.com>
 (Murat Demirten's message of "Sun, 3 Jun 2012 14:17:25 +0300")
References: <CA+pfegELseWchx5hbbChKKi-=xtQMO9CWTyKBEV+6RpRQVEqBA@mail.gmail.com>
 <20120603092136.3a462ea1@skate>
 <CA+pfegGdB802LwiCLn+frAJDyqYTpx2B59qgZLXwrJNU9vrExg@mail.gmail.com>
 <CAHXCMMKBJU4kO_H-WA-B2fHKZk0AK9C6EXqPtfqb5yU47i9mmQ@mail.gmail.com>
 <CA+pfegFoEQB_=byD-fyvZt_0SJYy5Dtu5dhATDh29ay66Fk6tg@mail.gmail.com>
Message-ID: <87aa0jseft.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Murat" == Murat Demirten <mdemirten@yh.com.tr> writes:

 Murat> Hi,

 Murat> Your solution will work. Adding a PROVIDES mechanism need more
 Murat> work (like the what is provides-default of jpeg?). I'm not
 Murat> changing anything in patch now. I'm not sure about that to add a
 Murat> generic PROVIDES mechanism because it will increase the
 Murat> buildroot complexity if only used by jpeg-turbo. When we see
 Murat> that there are more packages like this, we have to add generic
 Murat> PROVIDES mechanism.

 Murat> jpeg-turbo's performance gain depends to type of images you're
 Murat> working on too.  We tested it on mips and arm platform (yes, it
 Murat> make difference on mips too) and it is %30-%50 times faster than
 Murat> libjpeg (I don't have the exact results now).  It is a big
 Murat> difference when you have to make lots of jpeg decompression in
 Murat> your program.

Is there any reason to NOT use jpeg-turbo? Isn't it source level
compatible with the "normal" libjpeg?

-- 
Bye, Peter Korsgaard
