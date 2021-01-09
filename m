From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 09 Jan 2021 16:09:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/p11-kit: security bump to
 version 0.23.22
In-Reply-To: <20210108181157.606055-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 8 Jan 2021 19:11:57 +0100")
References: <20210108181157.606055-1-fontaine.fabrice@gmail.com>
Message-ID: <87zh1iw3i3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix memory-safety issues that affect the RPC protocol (CVE-2020-29361,
 >   CVE-2020-29362 and CVE-2020-29363)
 > - Update indentation in hash file (two spaces)

 > https://github.com/p11-glue/p11-kit/blob/0.23.22/NEWS

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Great, I was just about to do such a patch myself.

Committed, thanks.

-- 
Bye, Peter Korsgaard
