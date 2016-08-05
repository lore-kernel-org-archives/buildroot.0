From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2016 09:35:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi: Update upstream patch to
 support libcurl >= 7.5.1
In-Reply-To: <dc1e7bf2-8eff-cab0-db47-8bf0568e4d91@gmail.com>
References: <1470343668-28172-1-git-send-email-bernd.kuhls@t-online.de>
 <20160804231621.4da74f35@free-electrons.com>
 <dc1e7bf2-8eff-cab0-db47-8bf0568e4d91@gmail.com>
Message-ID: <20160805093519.2e0d4184@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 4 Aug 2016 19:46:40 -0700, Khem Raj wrote:

> > On Thu,  4 Aug 2016 22:47:48 +0200, Bernd Kuhls wrote:  
> >> An updated patch was committed to Kodi after Curl added a fix to address
> >> the original problem:
> >> https://github.com/curl/curl/commit/d6604524ad24daf4581efbe0020da058d2b3af84  
> > 
> > Is this commit part of a curl release? If so, is this curl release the
> > one we use in Buildroot?  
> 
> it will be in next version of curl.

OK.

> > 
> > IOW, I don't understand if the below patch for Kodi requires a newer
> > version of curl than the one we have in Buildroot today.  
> 
> no it does not require it. but of BR is using curl 7.50.0 then it
> should be bumped to 7.50.1, since this issue is affecting many other
> packages too.

We are already using 7.50.1.

Thanks for the infos!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
