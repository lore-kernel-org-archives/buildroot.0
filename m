From: Richard Braun <rbraun@sceen.net>
Date: Thu, 20 Sep 2012 23:12:55 +0200
Subject: [Buildroot] [PATCH] intel-microcode: new package
In-Reply-To: <20120920223646.65a34101@skate>
References: <1348153949-30525-1-git-send-email-rbraun@sceen.net>
 <20120920223646.65a34101@skate>
Message-ID: <20120920211255.GA32421@mail.sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 20, 2012 at 10:36:46PM +0200, Thomas Petazzoni wrote:
> Is there a license file somewhere that states that even though it is
> proprietary, one has the right to redistribute the binaries?

On the Intel download site, after searching for the last version of the
microcode data file [1], the download link leads to a license agreement
page which describes three license terms, depending on the nature of the
distributor (network administrator, end user or OEM). I think the OEM
license applies to most buildroot users. Here is the content :

"OEM LICENSE: You may reproduce and distribute the Software only as an 
integral part of or incorporated in Your product or as a standalone 
Software maintenance update for existing end users of Your products, 
excluding any other standalone products, subject to these conditions:

1. This Software is licensed for use only in conjunction with Intel 
component products. Use of the Software in conjunction with non-Intel 
component products is not licensed hereunder.
2. You may not copy, modify, rent, sell, distribute or transfer any part 
of the Software except as provided in this Agreement, and you agree to 
prevent unauthorized copying of the Software.
3. You may not reverse engineer, decompile, or disassemble the Software. 
4. You may only distribute the Software to your customers pursuant to a 
written license agreement. Such license agreement may be a "break-the-
seal" license agreement. At a minimum such license shall safeguard 
Intel's ownership rights to the Software.
5. The Software may include portions offered on terms in addition to those
set out here, as set out in a license accompanying those portions."

-- 
Richard Braun

[1] http://downloadcenter.intel.com/Detail_Desc.aspx?agr=Y&DwnldID=21385&keyword=microcode&lang=eng
