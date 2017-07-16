From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Jul 2017 23:26:07 +0200
Subject: [Buildroot] [PATCH] libosip2: add upstream security fix
In-Reply-To: <20170716142309.24699-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 16 Jul 2017 16:23:09 +0200")
References: <20170716142309.24699-1-peter@korsgaard.com>
Message-ID: <87eftg845s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2016-10324 - In libosip2 in GNU oSIP 4.1.0, a malformed SIP
 > message can lead to a heap buffer overflow in the osip_clrncpy() function
 > defined in osipparser2/osip_port.c.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
