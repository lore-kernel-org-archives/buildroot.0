From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Feb 2021 17:34:47 +0100
Subject: [Buildroot] [PATCH 2/2] package/tzdata: bump version to 2020f
In-Reply-To: <602ba0f2-503c-7175-c4fb-7dcac246631c@gmail.com> (Romain Naour's
 message of "Sun, 14 Feb 2021 16:44:44 +0100")
References: <20210110164711.1708062-1-bernd.kuhls@t-online.de>
 <20210110164711.1708062-2-bernd.kuhls@t-online.de>
 <87zh1ekq9r.fsf@dell.be.48ers.dk>
 <19dff490-6537-bc7d-7035-e4bd99f97452@gmail.com>
 <877dnad5ux.fsf@dell.be.48ers.dk>
 <602ba0f2-503c-7175-c4fb-7dcac246631c@gmail.com>
Message-ID: <8735xyd2vs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

Hi,

 >> > This patch has been backported to stable version 2020.11.2 and 2020.02.10.
 >> > Can you have a look?
 >> 
 >> Are you able to reproduce it? When I gave it a quick test here I got
 >> sensible output from date.
 >> 
 >> But maybe I missed something?

 > Yes, I tried on master, 2020.02.x, 2020.11.x and 2020.02.9 and 2020.11.1 (before
 > the version bump).

 > I'm looking at it but I don't have a patch yet.

Ok, thanks. There was a report on IRC that timezones on uClibc were
broken as well because of an incompatibility between the new tzdata
files and tzdump.

-- 
Bye, Peter Korsgaard
