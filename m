From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Apr 2015 00:04:53 +0200
Subject: [Buildroot] Towards 2015.05-rc1
In-Reply-To: <20150419230245.64cf1410@free-electrons.com> (Thomas Petazzoni's
 message of "Sun, 19 Apr 2015 23:02:45 +0200")
References: <20150419220053.2c1d5b62@free-electrons.com>
 <XnsA481E23CAF8E0berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20150419230245.64cf1410@free-electrons.com>
Message-ID: <87sibutq0q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Bernd,
 > On Sun, 19 Apr 2015 22:14:24 +0200, Bernd Kuhls wrote:

 >> if possible and time allows for all involved persons I would like to see the 
 >> libudev series stuff in the next buildroot release. 

 > As far as I remember, someone needs to take over this series, no? I
 > believe you originally authored it, then Yann took over, then Peter
 > proposed to take over but did not resend it as far as I know.

Yes, sorry - I haven't forgotten about it, but I haven't been able to
find time for it yet. Realisticly seen, I probably won't be able to make
it within the next 10 days.

 > On my side, I am still a bit concerned by the usefulness of this
 > series. The use cases you have are anyway running big things (Kodi,
 > etc.) so I'm not sure why running udevd or not makes a big difference.
 > It does seem a lot of additional complexity for not such a huge
 > benefit.

I agree that it is a tradeoff. In the worst case it can be handled in a
post-build script.

My own usecase was to use libinput for some keyboard/mouse/touchscreen
handling on a small system and disliking the udevd dependency.

-- 
Bye, Peter Korsgaard
