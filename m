From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 09 Jan 2012 11:35:43 +0100
Subject: [Buildroot] [PATCH] python-netifaces: add -x option to fix
	cross-compilation
In-Reply-To: <20120109112018.64832095@skate> (Thomas Petazzoni's message of
 "Mon, 9 Jan 2012 11:20:18 +0100")
References: <1326094927-27207-1-git-send-email-yegorslists@googlemail.com>
 <8739bpffv1.fsf@macbook.be.48ers.dk>
 <4F0ABA03.3030206@visionsystems.de> <20120109112018.64832095@skate>
Message-ID: <87y5thduyo.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Mon, 09 Jan 2012 10:57:23 +0100,
 Thomas> Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :

 >> That's really strange. I used CodeSourcery toolchain and had no
 >> problems, but with native BR toolchain I have the same behavior as
 >> yours. I'll look into this issue.

 Thomas> CodeSourcery toolchains use glibc, so they have IPv6 support enabled.

Yes, but that doesn't explain the 2nd error (missing ;):

        Py_XDECREF (dict);
        Py_XDECREF (list)
        Py_XDECREF (family);

-- 
Bye, Peter Korsgaard
