From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Mar 2017 14:30:57 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: remove sha1 external
	dependency
In-Reply-To: <CANLo3Jh+o-QJoDBrMv_C8NzGUaQTZXY7Hg51RrMC+R7P09BYxw@mail.gmail.com>
 (Romain Naour's message of "Tue, 28 Mar 2017 09:34:46 +0200")
References: <20170326201744.12202-1-romain.naour@gmail.com>
 <8760it6fof.fsf@dell.be.48ers.dk>
 <CANLo3Jh+o-QJoDBrMv_C8NzGUaQTZXY7Hg51RrMC+R7P09BYxw@mail.gmail.com>
Message-ID: <87mvc54m7y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

Hi,

 > What about the comment and logic in Config.in?

 >        # We need a SHA1 implementation. If either openssl or
 >         # libgcrypt are already part of the build, we'll use one of
 >         # them, otherwise, use the small libsha1 library.
 >         select BR2_PACKAGE_LIBSHA1 if (!BR2_PACKAGE_OPENSSL &&
 > !BR2_PACKAGE_LIBGCRYPT)


 > I missed it...
 > It must be removed as well.

 > Can you fix this ?

Sure, I've sent a patch.

-- 
Bye, Peter Korsgaard
