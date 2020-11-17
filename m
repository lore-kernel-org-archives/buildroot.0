From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2020 20:58:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/c-ares: security bump to
 version 1.17.0
In-Reply-To: <20201117071054.22525-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 17 Nov 2020 08:10:54 +0100")
References: <20201117071054.22525-1-fontaine.fabrice@gmail.com>
Message-ID: <87r1or21sw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - avoid read-heap-buffer-overflow in ares_parse_soa_reply found during
 >   fuzzing
 > - Avoid theoretical buffer overflow in RC4 loop comparison
 > - Empty hquery->name could lead to invalid memory access
 > - ares_parse_{a,aaaa}_reply() could return a larger *naddrttls than was
 >   passed in

 > https://c-ares.haxx.se/changelog.html#1_17_0

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
