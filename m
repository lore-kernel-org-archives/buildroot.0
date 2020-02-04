From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Feb 2020 13:54:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/jack2: drop dependency on
 host-python
In-Reply-To: <20200204094842.18729-1-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Tue, 4 Feb 2020 10:48:42 +0100")
References: <20200204094842.18729-1-titouan.christophe@railnova.eu>
Message-ID: <87tv46ldhf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > host-python was listed in jack2 dependencies, but is actually
 > not needed. Also tested with an experimental python3 based
 > Waf package infrastructure, so we can exclude that jack2
 > "accidentally" uses the host-python2 pulled in by Waf.

 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

Committed, thanks.

-- 
Bye, Peter Korsgaard
