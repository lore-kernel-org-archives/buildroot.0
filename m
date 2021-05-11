From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 May 2021 09:50:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/ruby: links with atomic if
 needed
In-Reply-To: <20210510203710.1582289-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 10 May 2021 22:37:10 +0200")
References: <20210510203710.1582289-1-fontaine.fabrice@gmail.com>
Message-ID: <87fsytr9ol.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build fails since bump to version 3.0.0 in commit
 > af5226f2fd1292a26f2dfda32f41cbbad7aa4cc because ruby needs atomic
 > operation support since
 > https://github.com/ruby/ruby/commit/6ed6b85ece8733518a7da0c3ec714f20d1102bf5

 > Fixes:
 >  - http://autobuild.buildroot.org/results/84ee5f4688be994a5440c3a61bddabee72ca3b3c

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
