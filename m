From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Mar 2020 23:34:33 +0100
Subject: [Buildroot] [PATCH 1/2] package/taglib: fix CVE-2017-12678
In-Reply-To: <20200301203759.218341-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 1 Mar 2020 21:37:58 +0100")
References: <20200301203759.218341-1-fontaine.fabrice@gmail.com>
Message-ID: <87zhcycrnq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > In TagLib 1.11.1, the rebuildAggregateFrames function in
 > id3v2framefactory.cpp has a pointer to cast vulnerability, which allows
 > remote attackers to cause a denial of service or possibly have
 > unspecified other impact via a crafted audio file.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
