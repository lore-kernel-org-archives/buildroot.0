From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Oct 2020 10:09:23 +0200
Subject: [Buildroot] [PATCH 1/2] package/zlib-ng: drop unrecognized CC
 variable
In-Reply-To: <20201011194357.1923003-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 11 Oct 2020 21:43:56 +0200")
References: <20201011194357.1923003-1-fontaine.fabrice@gmail.com>
Message-ID: <87blh7uaq4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Drop unneeded CC variable which is not recognized by cmake:
 > CMake Warning:
 >   Manually-specified variables were not used by the project:

 >     BUILD_DOC
 >     BUILD_DOCS
 >     BUILD_EXAMPLE
 >     BUILD_EXAMPLES
 >     BUILD_TEST
 >     BUILD_TESTING
 >     BUILD_TESTS
 >     CC

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
