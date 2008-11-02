From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Nov 2008 21:19:17 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
In-Reply-To: <061E11D86E3DFF459604DF5B36F0805F1BA6D3@salka01.valka.local>
	("Arnar Mar =?utf-8?Q?Sigur=C3=B0sson=22's?= message of "Sat\,
	1 Nov 2008 13\:46\:11 -0000")
References: <20081031171723.6F149F8055@busybox.net>
	<200811011247.26080.markus.heidelberg@web.de>
	<061E11D86E3DFF459604DF5B36F0805F1BA6D3@salka01.valka.local>
Message-ID: <87skq9rid6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnar" == Arnar Mar Sigur?sson <antab@valka.is> writes:

Hi,

 >>> +    default n
 >> is not necessary in all the options

 Arnar> Is "default n" the default? Was not sure because i have seen
 Arnar> other packages use "default n".

There shouldn't be any after r22874 - If there are, then that's an
error.

-- 
Bye, Peter Korsgaard
