From: Carmelo AMOROSO <carmelo.amoroso@st.com>
Date: Thu, 23 Aug 2007 14:01:37 +0200
Subject: [Buildroot] gcc-4.2.1 uclibc-locale patches: XCLOCALE instead of
	XLOCALE macro
Message-ID: <46CD7721.7010200@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,
looking at the the gcc-4.2.1 patches for uClibc, I found that the
200-uclibc-locale and 205-uclibc-locale-update patches uses a not 
existing macro
__UCLIBC_HAS_XCLOCALE__ while they should refer to __UCLIBC_HAS_XLOCALE__

Regards,
Carmelo
