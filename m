From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 29 Jun 2007 10:16:06 +0200
Subject: [Buildroot] Bad aterisk url
In-Reply-To: <012901c7b9cc$153b6730$ebba820a@atmel.com>
References: <61c0054e0706281252s3d40beb3h476a2dbd8dddc921@mail.gmail.com>
	<012901c7b9cc$153b6730$ebba820a@atmel.com>
Message-ID: <20070629081606.GD8033@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 28, 2007 at 10:53:44PM +0200, Ulf Samuelsson wrote:
>
>> wget --passive-ftp -P /home/grhuser/buildroot/dl
>> http://www.zlib.net//zlib-1.2.3.tar.bz2
>> --14:48:33--  http://www.zlib.net//zlib-1.2.3.tar.bz2
>>           => `/home/grhuser/buildroot/dl/zlib-1.2.3.tar.bz2'
>> Resolving www.zlib.net... 69.73.181.135
>> Connecting to www.zlib.net|69.73.181.135|:80... failed: No route to host.
>> make: *** [/home/grhuser/buildroot/dl/zlib-1.2.3.tar.bz2] Error 1
>> 
>> Checked the url myself. It is a dead link. Is there an alternative to this.
>> Searched the archives and did not find one.
>> 
>http://prdownloads.sourceforge.net/libpng/zlib-1.2.3.tar.bz2 

applied. Thanks!
