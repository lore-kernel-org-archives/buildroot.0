From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2020 23:50:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/uhd: fix typo
In-Reply-To: <20201117201941.138091-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 17 Nov 2020 21:19:41 +0100")
References: <20201117201941.138091-1-fontaine.fabrice@gmail.com>
Message-ID: <87v9e3y4wy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Replace ENABLE_DPKD by ENABLE_DPDK to fix the following error:
 >   Manually-specified variables were not used by the project:

 >     BUILD_DOC
 >     BUILD_DOCS
 >     BUILD_EXAMPLE
 >     BUILD_EXAMPLES
 >     BUILD_TEST
 >     BUILD_TESTING
 >     BUILD_TESTS
 >     ENABLE_DPKD

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
