From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Aug 2019 08:51:54 +0200
Subject: [Buildroot] [PATCH 2/2] package/vlc: security bump version to
 3.0.8
In-Reply-To: <20190821180701.6796-2-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Wed, 21 Aug 2019 20:07:01 +0200")
References: <20190821180701.6796-1-bernd.kuhls@t-online.de>
 <20190821180701.6796-2-bernd.kuhls@t-online.de>
Message-ID: <877e714u0l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes: https://www.videolan.org/developers/vlc-branch/NEWS
 > Fixes the following security bugs:
 >  * Fix a buffer overflow in the MKV demuxer (CVE-2019-14970)
 >  * Fix a read buffer overflow in the avcodec decoder (CVE-2019-13962)
 >  * Fix a read buffer overflow in the FAAD decoder
 >  * Fix a read buffer overflow in the OGG demuxer (CVE-2019-14437, CVE-2019-14438)
 >  * Fix a read buffer overflow in the ASF demuxer (CVE-2019-14776)
 >  * Fix a use after free in the MKV demuxer (CVE-2019-14777, CVE-2019-14778)
 >  * Fix a use after free in the ASF demuxer (CVE-2019-14533)
 >  * Fix a couple of integer underflows in the MP4 demuxer (CVE-2019-13602)
 >  * Fix a null dereference in the dvdnav demuxer
 >  * Fix a null dereference in the ASF demuxer (CVE-2019-14534)
 >  * Fix a null dereference in the AVI demuxer
 >  * Fix a division by zero in the CAF demuxer (CVE-2019-14498)
 >  * Fix a division by zero in the ASF demuxer (CVE-2019-14535)

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
