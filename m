From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 Feb 2012 10:17:16 +0100
Subject: [Buildroot] [PATCH v2] mdev.conf: Add ttyO devices
In-Reply-To: <CA+-urNTAU868R8gnWobgWkTKOpK9J=9Lje5jYCHQxjygMXPz1Q@mail.gmail.com>
 (Frank Hunleth's message of "Wed, 1 Feb 2012 22:40:42 -0500")
References: <1325564832-3149-1-git-send-email-fhunleth@troodon-software.com>
 <87mx92ci3e.fsf@macbook.be.48ers.dk>
 <CA+-urNTAU868R8gnWobgWkTKOpK9J=9Lje5jYCHQxjygMXPz1Q@mail.gmail.com>
Message-ID: <871uqdd277.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:

 >> ?Frank> +ttyO[0-9]* ? ? root:root 660
 >> 
 >> What does this exactly do? Isn't root:root / perm 660 default anyway?

 Frank> I just removed the line from my configuration, and everything works
 Frank> fine. At the moment, I do not understand how I had seen the console
 Frank> not work without the line last month. However, it is clearly not
 Frank> needed. Please disregard the patch. Sorry about the noise.

Ok, good and no problem.

-- 
Bye, Peter Korsgaard
