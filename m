From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 May 2019 10:07:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/mono-gtksharp3: fix build with
 latest mono
In-Reply-To: <20190521202056.17117-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 21 May 2019 22:20:56 +0200")
References: <20190521202056.17117-1-fontaine.fabrice@gmail.com>
Message-ID: <878suxtwyq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fixes:
 >  - http://autobuild.buildroot.org/results/7cae5b32285fe0edf69eab3297be9c6a4e76b7b8

This is a failure on next, but as mono hasn't been updated in next I
guess this applies to master.

Committed, thanks.

-- 
Bye, Peter Korsgaard
