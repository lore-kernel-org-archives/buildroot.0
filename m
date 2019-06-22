From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sat, 22 Jun 2019 18:00:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/whois: bump to version 5.4.3
In-Reply-To: <20190622174831.1d877d9a@windsurf>
References: <1561208392-11096-1-git-send-email-pjtexier@koncepto.io>
 <20190622174831.1d877d9a@windsurf>
Message-ID: <9513929e-a959-4122-ea95-aed4941cfe46@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 22/06/2019 ? 17:48, Thomas Petazzoni a ?crit?:
> Nope, changing the site location is not a good idea, see below.
> 
>> -WHOIS_VERSION = 5.4.0
>> -WHOIS_SITE =http://snapshot.debian.org/archive/debian/20181026T220636Z/pool/main/w/whois
>> +WHOIS_VERSION = 5.4.3
>> +WHOIS_SITE =http://ftp.debian.org/debian/pool/main/w/whois
> The problem withftp.debian.org  URLs is that they are not stable. As
> Debian moves forward, whois 5.4.3 will become no longer packaged in
> Debian, and will disappear fromftp.debian.org. snapshot.debian.org
> URLs however are stable. So we should continue to use a
> snapshot.debian.org URL.

Thanks for the clarification, I didn't know that.

-- 
Pierre-Jean Texier
Embedded Linux Engineer
https://koncepto.io
