From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Apr 2020 20:30:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/hiredis: security bump to
 version 0.14.1
In-Reply-To: <20200328085230.899562-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 28 Mar 2020 09:52:30 +0100")
References: <20200328085230.899562-1-fontaine.fabrice@gmail.com>
Message-ID: <87zhbnno6p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2020-7105: async.c and dict.c in libhiredis.a in hiredis
 >   through 0.14.0 allow a NULL pointer dereference because malloc return
 >   values are unchecked.
 > - Update indentation of hash file (two spaces)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, 2019.11.x and 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
