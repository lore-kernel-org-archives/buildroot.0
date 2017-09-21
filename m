From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 11:32:58 +0200
Subject: [Buildroot] [PATCH 1/1] Update github hashes
In-Reply-To: <jlcc9exvri.ln2@ID-313208.user.individual.net> (Bernd Kuhls's
 message of "Thu, 21 Sep 2017 11:17:07 +0200")
References: <20170920112825.3971-1-bernd.kuhls@t-online.de>
 <87fubhxnnx.fsf@dell.be.48ers.dk>
 <CANQCQpa9S7chHUTg1GBNz9Qi=r-tMeQnQO2sYpNdZ7oQ+9MP9w@mail.gmail.com>
 <1loa9exfa8.ln2@ID-313208.user.individual.net>
 <87377gy0ot.fsf@dell.be.48ers.dk>
 <jlcc9exvri.ln2@ID-313208.user.individual.net>
Message-ID: <87tvzwwg51.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Am Thu, 21 Sep 2017 09:23:46 +0200 schrieb Peter Korsgaard:
 >>>>>>> "Bernd" == Bernd Kuhls
 >>>>>>> <bernd.kuhls@t-online.de> writes:
 >> 
 >> > Not committing this patch means that downloading the kodi package
 >> > will always fail. Otoh I recognize the mess for the lts versions...
 >> 
 >> Odd that hasn't been downloaded yet, but kodi was only very recently
 >> bumped (post-2017.08), so there's no problem fixing the hash there.
 >> 
 >> Can you send a patch only fixing the kodi hash?

 > Hi Peter,

 > sent http://patchwork.ozlabs.org/patch/816774/ which updates only those 
 > packages where sources.buildroot.net does not store a copy of the 
 > previous tarball, not only kodi was affected.

Thanks!

 > Regarding the build of kodi by autobuilders I think it currently does not 
 > happen unless at least one of the autobuilders has a full-blown jdk 
 > installed.

Ahh, and that also explains why the tarball wasn't on our mirror - That
machine also doesn't have a jdk.

I'll manually put the tarball there now.

-- 
Bye, Peter Korsgaard
