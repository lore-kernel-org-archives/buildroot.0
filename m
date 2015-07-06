From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 6 Jul 2015 23:37:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/libtool: disable makeinfo
In-Reply-To: <20150704124513.77ae2841@free-electrons.com>
References: <e64f1903478b53f185f3bf114f86c46948a31311.1435886073.git.sam.bobroff@au1.ibm.com>
 <20150704124513.77ae2841@free-electrons.com>
Message-ID: <559AF52D.5090106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/04/15 12:45, Thomas Petazzoni wrote:
> Dear Sam Bobroff,
> 
> On Fri,  3 Jul 2015 11:14:38 +1000, Sam Bobroff wrote:
>> host-libtool can fail to build if the host is missing makeinfo, so
>> disable it.
>>
>> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
>> ---
>> Without this patch, buildroot fails to build host-libtool on my Debian
>> 8 system, as it doesn't have the texinfo package installed.
> 
> Applied, thanks.
> 
> Thomas
> 

 BTW, Thomas, any idea why the autobuilders didn't catch this? Do the chroots
have texinfo installed?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
