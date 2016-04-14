From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Apr 2016 22:51:43 +0200
Subject: [Buildroot] [PATCH] imlib2: security bump to version 1.4.8
In-Reply-To: <1460648615-26957-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 14 Apr 2016 12:43:35 -0300")
References: <1460648615-26957-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8760vjj4m8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2016-3994 - out of bound read in GIF loader
 > CVE-2011-5326 - divide by zero on 2x1 ellipse

 > Switch to sourceforge hashes.
 > And drop all previous patches, they're upstream, yay.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
