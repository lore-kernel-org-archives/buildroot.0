From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Apr 2021 13:36:31 +0200
Subject: [Buildroot] [PATCH 2/2] package/{glibc,
 localedef}: bump to version
 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c
In-Reply-To: <c5b1b792-4ac6-7452-eb36-8c8916413bf0@gmail.com> (Romain Naour's
 message of "Mon, 26 Apr 2021 23:19:42 +0200")
References: <20210426101021.2418145-1-romain.naour@gmail.com>
 <20210426101021.2418145-2-romain.naour@gmail.com>
 <e539cd7b-3775-024e-1f9f-67658e38a10b@mind.be>
 <c5b1b792-4ac6-7452-eb36-8c8916413bf0@gmail.com>
Message-ID: <87y2d4c62o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

Hi,

 > For toolchain-builder project, this means that the stable and bleeding-edge
 > toolchain use the same glibc version, unlike for other toolchain elements.

But maybe the stable toolchain should be built from the Buildroot LTS
instead of the "bleeding edge" Buildroot version?

-- 
Bye, Peter Korsgaard
