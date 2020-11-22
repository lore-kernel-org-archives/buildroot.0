From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Nov 2020 15:31:48 +0100
Subject: [Buildroot] [PATCH v2] package/raptor: fix CVE-2017-18926
In-Reply-To: <20201121124447.25396-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 21 Nov 2020 13:44:47 +0100")
References: <20201121124447.25396-1-peter@korsgaard.com>
Message-ID: <87sg91v4x7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > raptor_xml_writer_start_element_common in raptor_xml_writer.c in Raptor RDF
 > Syntax Library 2.0.15 miscalculates the maximum nspace declarations for the
 > XML writer, leading to heap-based buffer overflows (sometimes seen in
 > raptor_qname_format_as_xml).

 > For more details, see the oss-security discussion:
 > https://www.openwall.com/lists/oss-security/2020/11/13/1

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 > Changes since v1:
 > - Add _IGNORE_CVES entry for patch

Committed, thanks.

-- 
Bye, Peter Korsgaard
