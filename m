From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 21:02:54 +0100
Subject: [Buildroot] [PATCH 1/2] package/gerbera: fix linking with
 std::filesystem
In-Reply-To: <20210126172526.2133034-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 26 Jan 2021 18:25:25 +0100")
References: <20210126172526.2133034-1-fontaine.fabrice@gmail.com>
Message-ID: <87h7n025jl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Do not force to CXX_FILESYSTEM_NO_LINK_NEEDED to ON to allow gerbera to
 > link with the approriate library for std::filesystem

 > It should be noted that check_cxx_source_runs has been dropped since
 > version 1.6.0 and
 > https://github.com/gerbera/gerbera/commit/a3a64bed1d78fc51c7ab298db019c89852acb80c

 > Fixes:
 >  - http://autobuild.buildroot.org/results/0fcd0ce167c04f788bf1b9414ae5e7677691c7cf

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
