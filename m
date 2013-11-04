From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Nov 2013 00:48:14 +0100
Subject: [Buildroot] Speeding up builds
In-Reply-To: <20131105002042.704dabfe@skate> (Thomas Petazzoni's message of
 "Tue, 5 Nov 2013 00:20:42 +0100")
References: <CAE9DZUT-G8g5cwWamULZ2ppUSOHjNf1O35diTno-uZj1_tCggA@mail.gmail.com>
 <20131105002042.704dabfe@skate>
Message-ID: <87mwljohj5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Dallas Clement,
 > On Mon, 4 Nov 2013 13:00:54 -0600, Dallas Clement wrote:

 >> I'm just looking for some tips on how to speed up my build times.  My
 >> rootfs contains many packages with lots of dependencies.  Even with 8
 >> fast Xeon cores, 64GB of RAM, SSDs, and SAS drives, my builds are
 >> taking 1 hour and 50 minutes.

~2h sounds quite long indeed. I don't use as many packages as you, but a
fairly big config (123 packages, including Qt and Gstreamer1) takes <
20mins on a pretty normal quad haswell (E3-1240) / 32G RAM / SSDs.

-- 
Bye, Peter Korsgaard
