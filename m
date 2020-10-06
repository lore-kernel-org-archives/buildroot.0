From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Oct 2020 22:51:41 +0200
Subject: [Buildroot] [PATCH 2/2] package/glibc: bump to version
 2.32-4-g69beb5cbf85cae1c61fe7432500ac10880dc7b07
In-Reply-To: <def26807-e0af-5a4a-787d-a3ec2807cc21@gmail.com> (Romain Naour's
 message of "Tue, 6 Oct 2020 22:36:55 +0200")
References: <20201002155931.1529915-1-romain.naour@gmail.com>
 <20201002155931.1529915-2-romain.naour@gmail.com>
 <87mu12s4rz.fsf@dell.be.48ers.dk>
 <def26807-e0af-5a4a-787d-a3ec2807cc21@gmail.com>
Message-ID: <87r1qb3wo2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

Hi,

 >> These security fixes were already in 2.31.1, E.G. what we are currently
 >> using, right?

 > Indeed, they has been added to glibc 2.32 and backported to stable branches.
 > It's just a copy from the release announcement... we can drop it if you prefer.

I indeed think it makes sense to drop it, as it doesn't describe the
delta from our current version and this one.

-- 
Bye, Peter Korsgaard
