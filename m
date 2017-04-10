From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 15:28:13 +0200
Subject: [Buildroot] [PATCH 1/1] libgphoto2: Add libgphoto2 package
In-Reply-To: <9eb2fed8-ded9-0da9-6307-50fa534934f7@sensefly.com>
References: <1491467592-21504-1-git-send-email-kevin.joly@sensefly.com>
 <3577f824-ddbf-7332-018c-221704ebaa46@mind.be>
 <9eb2fed8-ded9-0da9-6307-50fa534934f7@sensefly.com>
Message-ID: <1589b1f7-21ef-388c-3551-a2e892b4d970@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-04-17 14:23, Kevin JOLY wrote:
> Hi Arnout,
> 
> 
> Le 10. 04. 17 ? 12:20, Arnout Vandecappelle a ?crit :

[snip]
>>  It looks like there are some configure options you may want to pass explicitly,
>> like --disable-rpm. The package also installs a lot of stuff in non-standard
>> locations, it would be good to check if the defaults are appropriate. Also take
>> a look at README.packaging.
> Where did you find the --disable-rpm ? 

 I misread the configure.ac (gphoto-m4/gp-packaging.m4 actually). It's in fact
--without-rpmbuild.

> By non-standard location, do you mean the
> udevscriptdir and the utilsdir?

 Yes, udevscriptdir. utilsdir is OK.


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
