From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 23:16:19 +0100
Subject: [Buildroot] [PATCH 1/2] package/libftdi1: fix unresolved symbol
 issue
In-Reply-To: <CAGm1_kt8K_9fSXgbgwumE8SVbwMDfuJbPVSF7EssYkxudx9k1Q@mail.gmail.com>
 (Yegor Yefremov's message of "Mon, 10 Feb 2020 10:15:06 +0100")
References: <20200210091149.8584-1-yegorslists@googlemail.com>
 <CAGm1_kt8K_9fSXgbgwumE8SVbwMDfuJbPVSF7EssYkxudx9k1Q@mail.gmail.com>
Message-ID: <87v9nbn9e4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

 > On Mon, Feb 10, 2020 at 10:11 AM <yegorslists@googlemail.com> wrote:
 >> 
 >> From: Yegor Yefremov <yegorslists@googlemail.com>
 >> 
 >> GCC later than 5.x produce _fdti1.so file with an undefined
 >> symbol str2charp_size due to C99 inline semantics change. So
 >> remove this keyword.
 >> 
 >> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
