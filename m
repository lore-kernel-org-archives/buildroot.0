From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 01 Feb 2020 16:02:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/suricata: fix lzma dependency
In-Reply-To: <20200131180800.1136153-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 31 Jan 2020 19:08:00 +0100")
References: <20200131180800.1136153-1-fontaine.fabrice@gmail.com>
Message-ID: <87eeveqrk3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > lzma package is a host-only package so replace this wrong dependency by
 > xz package

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
