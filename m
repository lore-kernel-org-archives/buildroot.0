From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 Sep 2017 23:47:34 +0200
Subject: [Buildroot] [PATCH] tcpdump: security bump to version 4.9.2
In-Reply-To: <20170909221229.57da435a@windsurf.lan> (Thomas Petazzoni's
 message of "Sat, 9 Sep 2017 22:12:29 +0200")
References: <20170908121903.11830-1-peter@korsgaard.com>
 <20170909221229.57da435a@windsurf.lan>
Message-ID: <87bmmi8bux.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > Applied to master, thanks. Interesting number of CVEs being fixed here.
 > Are they trying to generate an integer overflow in the CVE
 > database ? :-)

Something like that, yes ;)

The issue was apparently supposed to be under an embargo until September
25th (which normally happens for "serious" issues), but it leaked by
accident:

http://www.openwall.com/lists/oss-security/2017/09/07/8

-- 
Bye, Peter Korsgaard
