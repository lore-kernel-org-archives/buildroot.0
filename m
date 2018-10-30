From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Oct 2018 20:56:47 +0100
Subject: [Buildroot] [PATCH 1/1] neardal: fix static build with libedit
 and libbsd
In-Reply-To: <20181028212038.11514-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 28 Oct 2018 22:20:38 +0100")
References: <20181028212038.11514-1-fontaine.fabrice@gmail.com>
Message-ID: <87a7mvfbsw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Add an upstreamable patch to use pkg-config for finding libedit and
 > readline dependencies and drop ncurses "hack"

 > Fixes:
 >  - http://autobuild.buildroot.org/results/b0b17f4a5b0a32631a12bdb350ba7c21f7c595d0

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
