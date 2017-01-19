From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jan 2017 15:08:39 +0100
Subject: [Buildroot] [PATCH] gd: security bump to version 2.2.4
In-Reply-To: <20170119134451.8799-1-gustavo@zacarias.com.ar> (Gustavo
 Zacarias's message of "Thu, 19 Jan 2017 10:44:51 -0300")
References: <20170119134451.8799-1-gustavo@zacarias.com.ar>
Message-ID: <8760lbta54.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2016-9317 - gdImageCreate() doesn't check for oversized images and
 > as such is prone to DoS vulnerabilities.
 > CVE-2016-6912 - double-free in gdImageWebPtr()
 > (without CVE):
 > Potential unsigned underflow in gd_interpolation.c
 > DOS vulnerability in gdImageCreateFromGd2Ctx()
 > Signed Integer Overflow gd_io.c

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
