From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Apr 2014 00:25:10 +0200
Subject: [Buildroot] [PATCH 4/6] tzdump: new host package
In-Reply-To: <20140408221859.GA25398@free.fr> (Yann E. MORIN's message of
 "Wed, 9 Apr 2014 00:18:59 +0200")
References: <cover.1396900553.git.yann.morin.1998@free.fr>
 <bd0d8b1e63d1946a8dd482f5d40c54008bed8081.1396900553.git.yann.morin.1998@free.fr>
 <87d2gra2qt.fsf@dell.be.48ers.dk> <20140408221859.GA25398@free.fr>
Message-ID: <878urfa27t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> > +TZDUMP_DEPENDENCIES = host-zic
 >> 
 >> It doesn't look like this is needed.

 > Well, it's host-tzdump that needs host-zic, since the former needs a
 > header installed by the latter.

 > So, this should have been:

 >     HOST_TZDUMP_DEPENDENCIES = host-zic

Ahh ok, I'll fix that up.

-- 
Bye, Peter Korsgaard
