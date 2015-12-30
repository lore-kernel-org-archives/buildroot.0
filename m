From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Dec 2015 22:41:13 +0100
Subject: [Buildroot] [PATCH 3/3] vboot-utils: remove hash file
In-Reply-To: <20151230160016.14524b1f@free-electrons.com>
References: <cover.1451483256.git.alex.suykov@gmail.com>
 <05e1570e0377fc9e913819765ecb8e488b6b6c1a.1451483256.git.alex.suykov@gmail.com>
 <20151230160016.14524b1f@free-electrons.com>
Message-ID: <56844F79.3080903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30-12-15 16:00, Thomas Petazzoni wrote:
> Dear Alex Suykov,
> 
> On Wed, 30 Dec 2015 16:06:05 +0200, Alex Suykov wrote:
>> The package uses git to download the sources.
>>
>> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> 
> I think it is good to have hash files in this case, even if they simply
> indicate "there's no hash". This way, we will be able in the future to
> make hash files mandatory.
> 
> I *think* this was part of the conclusion we had at the latest
> Buildroot Developers Meeting, even if the write up at
> http://elinux.org/Buildroot:DeveloperDaysELCE2015 doesn't make this
> completely clear.

 I think we didn't get to a clear conclusion, except about the github hashes.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
