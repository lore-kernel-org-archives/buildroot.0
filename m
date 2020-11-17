From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2020 20:59:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/bctoolbox: drop GIT_EXECUTABLE
In-Reply-To: <20201117070451.11844-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 17 Nov 2020 08:04:51 +0100")
References: <20201117070451.11844-1-fontaine.fabrice@gmail.com>
Message-ID: <87mtzf21qp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > GIT_EXECUTABLE is not needed since version 4.3.0 and
 > https://github.com/BelledonneCommunications/bctoolbox/commit/a92ea8672fc0a736c9018de31588aeeeef4a4157
 > https://github.com/BelledonneCommunications/bctoolbox/commit/6c2e02ffb16f999e270c5de29bbf4dd13b9e986d

 > CMake Warning:
 >   Manually-specified variables were not used by the project:

 >     BUILD_DOC
 >     BUILD_DOCS
 >     BUILD_EXAMPLE
 >     BUILD_EXAMPLES
 >     BUILD_TEST
 >     BUILD_TESTING
 >     BUILD_TESTS
 >     GIT_EXECUTABLE

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
