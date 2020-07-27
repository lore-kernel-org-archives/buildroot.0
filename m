From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jul 2020 22:09:36 +0200
Subject: [Buildroot] [PATCH v3 1/7] configs/guest_*: some new defconfig
In-Reply-To: <CAB0FRssErmq8AO_yDOYjGFwjY9=OWOP_x4SDu0WOPwW5GbeOFg@mail.gmail.com>
 (=?utf-8?Q?=22Fran=C3=A7ois?= Perrad"'s message of "Mon, 27 Jul 2020
 21:53:56 +0200")
References: <20200621080000.180089-1-francois.perrad@gadz.org>
 <20200621080000.180089-2-francois.perrad@gadz.org>
 <87o8o1uw29.fsf@dell.be.48ers.dk>
 <CAB0FRssErmq8AO_yDOYjGFwjY9=OWOP_x4SDu0WOPwW5GbeOFg@mail.gmail.com>
Message-ID: <87d04gu3cv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fran?ois" == Fran?ois Perrad <francois.perrad@gadz.org> writes:

 > Le lun. 27 juil. 2020 ? 11:49, Peter Korsgaard <peter@korsgaard.com> a
 > ?crit :

 >> >>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:
 >> 
 >> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 >> > ---
 >> >  DEVELOPERS                     |  1 +
 >> >  configs/guest_arm_a7_defconfig | 16 ++++++++++++++++
 >> >  configs/guest_arm_a9_defconfig | 18 ++++++++++++++++++
 >> >  configs/guest_x86_64_defconfig | 15 +++++++++++++++
 >> 
 >> Like Christian, I am not really convinced these defconfigs add any real
 >> value.
 >> 
 >> 
 > The documentation is the 2nd patch is the most valuable part.
 > Can we add board/guest/readme.txt without introducing some
 > configs/guest_*_defconfig ?

Sure, but it might be a bit hard to find. Would it not fit better in the
manual?

-- 
Bye, Peter Korsgaard
