From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Sep 2009 09:31:10 +0200
Subject: [Buildroot] [PATCH 1/5] Remove the "project" feature
In-Reply-To: <20090908092408.787e9cf7@surf> (Thomas Petazzoni's message of
	"Tue\, 8 Sep 2009 09\:24\:08 +0200")
References: <cover.1252361088.git.thomas.petazzoni@free-electrons.com>
	<cover.1252361088.git.thomas.petazzoni@free-electrons.com>
	<a57f463ae7b50d932282ded660a431251e1de379.1252361088.git.thomas.petazzoni@free-electrons.com>
	<87ljkp5317.fsf@macbook.be.48ers.dk> <20090908092408.787e9cf7@surf>
Message-ID: <874ord51vl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Stuff like /etc/br-version is handy atleast. I think it would be nice
 >> to keep all 3, as it is part of the current Kconfig interface, it
 >> makes it easy to do minimal customization when you use the generic
 >> rootfs skeleton and it adds only little complexity.

 Thomas> Agreed, this is something we can keep.

Good.

 >> The u-boot config stuff is imho way too overengineered, and could use
 >> some cleanup/simplification.

 Thomas> Definitely, but that was not the purpose of this set of patches. I
 Thomas> don't think it's reasonable to try to fix everything at once.

Certainly not. Seeing the note just reminded me about it.

Thanks for the patch series, much appreciated!

-- 
Bye, Peter Korsgaard
