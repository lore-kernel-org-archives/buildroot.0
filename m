From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Oct 2020 08:53:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/freetype: unconditionally
 disable harfbuzz
In-Reply-To: <20201002054429.2285564-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 2 Oct 2020 07:44:29 +0200")
References: <20201002054429.2285564-1-fontaine.fabrice@gmail.com>
Message-ID: <87lfgnyf49.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit 939e714393e9d7f60f3a198d831608b08a25662e added an optional
 > harfbuzz dependency to freetype but this creates a circular dependency
 > so unconditionally disable it

 > Fixes:
 >  - http://autobuild.buildroot.org/results/3cc4ce3207a253186a9c4f8f5151ea0fc0854a28

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
