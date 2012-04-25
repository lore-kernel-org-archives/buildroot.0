From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 25 Apr 2012 22:52:17 +0200
Subject: [Buildroot] Buildroot SKIPS PATCHES ???
In-Reply-To: <4F983762.2090008@petroprogram.com> ("Stefan =?utf-8?Q?Fr?=
 =?utf-8?Q?=C3=B6berg=22's?= message
 of "Wed, 25 Apr 2012 20:41:54 +0300")
References: <4F9341C9.8000508@petroprogram.com>
 <CAAXf6LX+De-fWuqb-nZBGyMkoqBdeqYz+qp=hDkUybCE_a-G4Q@mail.gmail.com>
 <4F9586EE.9090600@petroprogram.com>
 <CAAXf6LX3sUmETGmOcpMh=av4n3jkc18gHBFO3zkfwW=andjjmg@mail.gmail.com>
 <4F983762.2090008@petroprogram.com>
Message-ID: <87haw7bkla.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stefan" == Stefan Fr?berg <stefan.froberg@petroprogram.com> writes:


 Stefan> By the way, what is the normal process of offering new packages
 Stefan> to buildroot ?  I tried looking from buildroot pages for that
 Stefan> info but could not find it.

 Stefan> In addition to this wvstreams package I have wvdial, firefox
 Stefan> (not really an embedded system browser, but I can't live
 Stefan> without it), slim and Linux Pam packages under work.

 Stefan> Should I just offer them on buildroot mailing list for
 Stefan> reviewing or where ?

Yes, please send git-style patches to the mailing list for
review. Please also sign off on your patches (Linux kernel style) using
the -s option on git format-patch.

Once reviewed, then I'll commit the patches to git.

This is (very) shortly documented on the website:

http://buildroot.net/git.html

-- 
Bye, Peter Korsgaard
