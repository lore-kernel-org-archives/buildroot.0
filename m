From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Nov 2011 10:05:31 +0100
Subject: [Buildroot] [PATCH 6/6] lzma: remove deprecated
In-Reply-To: <CAAXf6LUO8WXMTDa07=ju9i3hN5JGTDOzWCQ+UhVEgTB3fWw-nA@mail.gmail.com>
 (Thomas De Schampheleire's message of "Wed, 9 Nov 2011 08:20:54
 +0100")
References: <1318343912-5480-1-git-send-email-gustavo@zacarias.com.ar>
 <1318343912-5480-6-git-send-email-gustavo@zacarias.com.ar>
 <87ehxiusex.fsf@macbook.be.48ers.dk>
 <CAAXf6LUO8WXMTDa07=ju9i3hN5JGTDOzWCQ+UhVEgTB3fWw-nA@mail.gmail.com>
Message-ID: <871uth4qec.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

Hi,

 >> It still seems to be used by fs/ and linux/ and dependencies check.

 Thomas> Which dependencies check do you mean?

I didn't really check the dependencies stuff, but the fs / linux stuff
looks real. I would prefer a lzma removal patch to clean it all up.

 Thomas> It's true that there is a toolchain/dependencies/check-host-lzma.sh
 Thomas> file, but it isn't used anywhere, together with
 Thomas> package/lzma/lzmacheck.sh. I have a pending patch to remove both
 Thomas> files, together with some other dependency stuff, but I'm waiting for
 Thomas> 2011.11-rc1 to not pollute the list too much.

Ok, sounds good.

-- 
Bye, Peter Korsgaard
