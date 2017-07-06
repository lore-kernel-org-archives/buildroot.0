From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 6 Jul 2017 23:56:33 +0200
Subject: [Buildroot] [PATCH] libtomcrypt: bump to version 1.18.0-rc1
In-Reply-To: <20170706205707.6402f1e3@windsurf.lan>
References: <20170706175456.11742-1-francois.perrad@gadz.org>
 <20170706202526.365ec65c@windsurf.lan>
 <CAB0FRstL5wU2_8smT2LPx9Xv9uBhmJQNax_paLH=u4H43kGt_g@mail.gmail.com>
 <20170706205707.6402f1e3@windsurf.lan>
Message-ID: <2da67364-2cbc-d3b8-86db-93f1f67e1897@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-07-17 20:57, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 6 Jul 2017 20:45:35 +0200, Fran?ois Perrad wrote:
> 
>>> Why would we upgrade to a release candidate version?
>>>
>> It's a good way to test it (with autobuilder).

 If you want to invest is something like that, you can set up an autobuilder
instance and define some _OVERRIDE_SRCDIR in your local.mk. But don't push those
build results to autobuild.buildroot.org!

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
