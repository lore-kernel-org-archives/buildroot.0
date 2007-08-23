From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 23 Aug 2007 14:10:09 +0200
Subject: [Buildroot] gcc-4.2.1 uclibc-locale patches: XCLOCALE
	instead	of XLOCALE macro
In-Reply-To: <46CD7721.7010200@st.com>
References: <46CD7721.7010200@st.com>
Message-ID: <20070823121009.GN11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 23, 2007 at 02:01:37PM +0200, Carmelo AMOROSO wrote:
>Hi All,
>looking at the the gcc-4.2.1 patches for uClibc, I found that the
>200-uclibc-locale and 205-uclibc-locale-update patches uses a not 
>existing macro
>__UCLIBC_HAS_XCLOCALE__ while they should refer to __UCLIBC_HAS_XLOCALE__

Can you send me a diff that works for you? (I don't use locale myself)

TIA,
