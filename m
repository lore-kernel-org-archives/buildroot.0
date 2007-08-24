From: Carmelo AMOROSO <carmelo.amoroso@st.com>
Date: Fri, 24 Aug 2007 11:21:31 +0200
Subject: [Buildroot] [PATCH] gcc-4.2.1/libstdc++  patch for locale_facets
Message-ID: <46CEA31B.9030006@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While doing test with C++ on uCLibc system, I found a bug into libstdc++
libraries in displaying floating pointer values by using 
ostream::operator<<(double)
method.
The problem is into locale_facet.tcc, and the attached patch solves it.
It affects only libstdc++ configured for uClibc.

Regards,
Carmelo
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: gcc-4.2.1-uclibc-locale_facets.patch
Url: http://busybox.net/lists/buildroot/attachments/20070824/06c3308b/attachment.diff 
