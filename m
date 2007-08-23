From: Carmelo AMOROSO <carmelo.amoroso@st.com>
Date: Thu, 23 Aug 2007 15:49:30 +0200
Subject: [Buildroot] gcc-4.2.1 uclibc-locale patches: XCLOCALE instead
 of XLOCALE macro
In-Reply-To: <20070823121009.GN11697@aon.at>
References: <46CD7721.7010200@st.com> <20070823121009.GN11697@aon.at>
Message-ID: <46CD906A.1050404@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
> On Thu, Aug 23, 2007 at 02:01:37PM +0200, Carmelo AMOROSO wrote:
>   
>> Hi All,
>> looking at the the gcc-4.2.1 patches for uClibc, I found that the
>> 200-uclibc-locale and 205-uclibc-locale-update patches uses a not 
>> existing macro
>> __UCLIBC_HAS_XCLOCALE__ while they should refer to __UCLIBC_HAS_XLOCALE__
>>     
>
> Can you send me a diff that works for you? (I don't use locale myself)
>
> TIA,
>
>   
Find attached the patches to fix the above mentioned patches

Cheers,
Carmelo
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: 205-uclibc-locale-update_patch.patch
Url: http://busybox.net/lists/buildroot/attachments/20070823/436ca073/attachment.diff 
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: 200-uclibc-locale_patch.patch
Url: http://busybox.net/lists/buildroot/attachments/20070823/436ca073/attachment-0001.diff 
