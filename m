From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Aug 2016 23:16:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi: Update upstream patch to
 support libcurl >= 7.5.1
In-Reply-To: <1470343668-28172-1-git-send-email-bernd.kuhls@t-online.de>
References: <1470343668-28172-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160804231621.4da74f35@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  4 Aug 2016 22:47:48 +0200, Bernd Kuhls wrote:
> An updated patch was committed to Kodi after Curl added a fix to address
> the original problem:
> https://github.com/curl/curl/commit/d6604524ad24daf4581efbe0020da058d2b3af84

Is this commit part of a curl release? If so, is this curl release the
one we use in Buildroot?

IOW, I don't understand if the below patch for Kodi requires a newer
version of curl than the one we have in Buildroot today.

Could you clarify?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
