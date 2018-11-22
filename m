From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Nov 2018 17:39:11 +0100
Subject: [Buildroot] [PATCH next 2/5] linux-headers: bump to kernel
 version 4.19.2
In-Reply-To: <92a6e6b55b9deb073d6aae08490a5820964eb69b.1542720610.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 20 Nov 2018 15:30:07 +0200")
References: <fb495883400fc9180b163358cf5c17d2f2c2e7d5.1542720610.git.baruch@tkos.co.il>
 <92a6e6b55b9deb073d6aae08490a5820964eb69b.1542720610.git.baruch@tkos.co.il>
Message-ID: <87pnuxm5hs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 >  package/linux-headers/Config.in.host | 11 ++++++++++-

You forgot to add the hash for 4.19.2. Committed to next with that
added, thanks.

-- 
Bye, Peter Korsgaard
