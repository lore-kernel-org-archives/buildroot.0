From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Jun 2017 16:35:53 +0200
Subject: [Buildroot] [PATCH] libtasn1: security bump to version 4.12
In-Reply-To: <20170529215448.763-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 29 May 2017 23:54:48 +0200")
References: <20170529215448.763-1-peter@korsgaard.com>
Message-ID: <87efv3ixme.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2017-7650: Two errors in the "asn1_find_node()" function
 > (lib/parser_aux.c) within GnuTLS libtasn1 version 4.10 can be exploited to
 > cause a stacked-based buffer overflow by tricking a user into processing a
 > specially crafted assignments file via the e.g.  asn1Coding utility.

 > For more details, see:

 > https://secuniaresearch.flexerasoftware.com/secunia_research/2017-11/

 > Or the 1.4.11 release mail (no mail about 1.4.12, but identical to 1.4.11 +
 > a soname fix):

 > https://lists.gnu.org/archive/html/help-libtasn1/2017-05/msg00003.html

 > Remove 0001-configure-don-t-add-Werror-to-build-flags.patch and autoreconf
 > as that patch is now upstream.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
