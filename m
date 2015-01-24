From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Jan 2015 01:10:58 +0100
Subject: [Buildroot] [PATCH 1/1] qt: make QtDeclarative depend on QtSql
In-Reply-To: <1410488495-2146-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Thu, 11 Sep 2014 22:21:35 -0400")
References: <1410488495-2146-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <87egql597x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

Hi,

 > As indicated by QtDeclarative.pc, QtDeclarative needs QtSql.
 > It builds fine without it, but then you get a run-time error.
 > So add QtSql to the QtDeclarative depends-on list.

 > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
