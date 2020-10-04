From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2020 11:38:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/elfutils: needs threads
In-Reply-To: <20201003193547.177673-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 3 Oct 2020 21:35:47 +0200")
References: <20201003193547.177673-1-fontaine.fabrice@gmail.com>
Message-ID: <874knatjo4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > threads is a mandatory dependency since version 0.178 and
 > https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=e9d4067a15eb100c0598a9895567aac6e9ed6a10

 > Fixes:
 >  - http://autobuild.buildroot.org/results/1c818a50530816ba80864efaacb724cb4bdeebf9

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
