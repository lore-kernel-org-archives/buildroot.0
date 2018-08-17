From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Aug 2018 19:29:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: security bump to
 version 1.0.2p
In-Reply-To: <62cj4fxe0i.ln2@ID-313208.user.individual.net> (Bernd Kuhls's
 message of "Fri, 17 Aug 2018 19:08:54 +0200")
References: <20180817053207.15702-1-bernd.kuhls@t-online.de>
 <87a7plcw36.fsf@dell.be.48ers.dk>
 <62cj4fxe0i.ln2@ID-313208.user.individual.net>
Message-ID: <87efewoq9b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Am Fri, 17 Aug 2018 09:04:45 +0200 schrieb Peter Korsgaard:
 >>>>>>> "Bernd" == Bernd Kuhls
 >>>>>>> <bernd.kuhls@t-online.de> writes:
 >> > Added upstream sha1 hash.
 >> 
 >> I'm not sure that really buys us much, but OK.

 > Hi Peter,

 > I am just following the manual:
 > http://buildroot.uclibc.org/downloads/manual/manual.html#adding-packages-
 > hash

 > "If upstream provides more than one type of hash (e.g. sha1 and sha512), 
 > then it is best to add all those hashes in the .hash file."

Heh, you win ;) I believe this was originally aimed at weaker hashes
(md5 and sha1), but you're right, it doesn't harm.

Thanks for the patch!

-- 
Bye, Peter Korsgaard
