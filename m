From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Apr 2016 21:46:12 +0200
Subject: [Buildroot] [git commit] configs/minnowboard_max: configure
	eth0 through dhcp
In-Reply-To: <CAAEAJfDQOgb1rGQQw5rXdPqrGW1ZYdAr__zG1O8DicDvJwQjuQ@mail.gmail.com>
 (Ezequiel Garcia's message of "Fri, 15 Apr 2016 16:23:23 -0300")
References: <20160415081911.5BA4A80338@busybox.osuosl.org>
 <CAAEAJfDqYwZ5e4Tq8-BaUqT5fWb=R3aQ5Vf2nNTJ4s63ukwsPQ@mail.gmail.com>
 <8737qmhf5u.fsf@dell.be.48ers.dk>
 <CAAEAJfDQOgb1rGQQw5rXdPqrGW1ZYdAr__zG1O8DicDvJwQjuQ@mail.gmail.com>
Message-ID: <87y48efyez.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ezequiel" == Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

 >> > Any reason why you are only doing this change for the Minnowboard MAX,
 >> > and not also the Minnowboard?
 >> 
 >> Only the fact that I have a max, but not one of the original
 >> minnowboards, so I couldn't test it.
 >> 
 >> Do you have one of the old ones? If not, I believe Thomas does.
 >> 

 > Hm, no I don't. But I'm pretty sure it has eth0 :-)

I guess so too, but E.G. the realtek on the max needs firmware to be
loaded so I didn't want to make any changes without being able to test
it.

Thomas, do you still have your board?

-- 
Venlig hilsen,
Peter Korsgaard 
