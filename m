From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Apr 2016 08:49:39 +0200
Subject: [Buildroot] [PATCH] php: security bump to version 5.6.21
In-Reply-To: <1461889196-21981-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 28 Apr 2016 21:19:56 -0300")
References: <1461889196-21981-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ziscucxo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes (CVEs not assigned yet):
 > bug #72094 - Out of bounds heap read access in exif header processing
 > bug #71912 - libgd: signedness vulnerability
 > bug #72061 - Out-of-bounds reads in zif_grapheme_stripos with negative offset
 > bug #71843 - null ptr deref ZEND_RETURN_SPEC_CONST_HANDLER
 > bug #71952 - Corruption inside imageaffinematrixget

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
