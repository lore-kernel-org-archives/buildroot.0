From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Nov 2016 11:01:28 +0100
Subject: [Buildroot] [PATCH v2 01/15] reproducibility: generate
 SOURCE_DATE_EPOCH
In-Reply-To: <20161119105159.0c7aed4b@free-electrons.com>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-2-git-send-email-jezz@sysmic.org>
 <20161118123351.69e79602@free-electrons.com>
 <d4388412-d390-fc7e-f6ba-685cb6a2104e@mind.be>
 <20161119105159.0c7aed4b@free-electrons.com>
Message-ID: <74a2dcf8-37dd-1d0b-c794-135fc19f0ac6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19-11-16 10:51, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 19 Nov 2016 09:51:27 +0100, Arnout Vandecappelle wrote:
> 
>>  Or maybe even easier:
>>
>> BR2_VERSION = 2016.11-rc1
>> BR2_VERSION_EPOCH = 1479545409
> 
> Yes, this seems like a good idea. It's a bit annoying that we have to
> update this, but it's the cleanest solution.

 An additional advantage is that you can leave it empty when no release has been
made yet, and error out in that case if no git is available.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
