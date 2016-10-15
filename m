From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 15 Oct 2016 18:28:40 +0200
Subject: [Buildroot] [PATCH 04/13] gcc: remove deprecated 4.7.x
In-Reply-To: <20161015171856.7b6f00fd@free-electrons.com>
References: <20161015145107.18264-1-arnout@mind.be>
 <20161015145107.18264-5-arnout@mind.be>
 <20161015171856.7b6f00fd@free-electrons.com>
Message-ID: <8a0553d1-9ab7-32b9-7aa9-669e11a97302@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-10-16 17:18, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 15 Oct 2016 16:50:58 +0200, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> We will remove BR2_DEPRECATED, so remove this deprecated option.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> ---
>>  Config.in.legacy                   |  7 +++++++
>>  package/gcc/Config.in.host         | 23 -----------------------
>>  package/gcc/gcc-final/gcc-final.mk | 12 ------------
>>  package/uclibc/uclibc.mk           |  7 +++----
>>  4 files changed, 10 insertions(+), 39 deletions(-)
> 
> This commit forgets to remove the gcc patches. It can be fixed when
> applying, I don't think it's worth resending just for this.

 Actually, same for binutils.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
