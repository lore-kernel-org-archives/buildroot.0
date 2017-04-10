From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 13:58:11 +0200
Subject: [Buildroot] buildroot | Pipeline #7531221 has failed for master
	| f78b2c13
In-Reply-To: <20170410135245.6492e3ae@free-electrons.com>
References: <58e9fbce8c9e8_17973fbd9c776b74668e1@worker-kiq07.fe.gitlab.com.mail>
 <20170409120255.0155c3fb@free-electrons.com>
 <aa7cc7f6-9b36-bfce-23f3-6131e7355bb6@mind.be>
 <20170410135245.6492e3ae@free-electrons.com>
Message-ID: <f5261c19-90cd-32ab-8d66-ca18b5ab0d96@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-04-17 13:52, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 9 Apr 2017 23:10:57 +0200, Arnout Vandecappelle wrote:
> 
>>  I configured the mirroring from git.buildroot.org to once per day. Apparently
>> the time when it syncs varies quite a bit. And apparently, it just didn't sync
>> today - the last sync is from Apr 8 2:18.
> 
> OK.
> 
>>  I could configure the mirror to once per hour instead, but then the CI will run
>> a little too often. OTOH, I guess you rarely push more than twice a day, right,
> 
> I do push much more than twice a day. When I'm actively merging
> patches, I'm almost pushing between every patch, so in a typical merge
> session, I can be doing 10, 20 pushes or more.
> 
>> so it's not going to make that much of a difference... But apparently, I can't
>> even change the synchronisation frequency, "Update every day" is the only option...
> 
> OK. Not ideal, but I guess we can live with this.

 There is actually an API to trigger a sync. So you could use that to trigger a
sync e.g. half an hour before triggering the build. I'll have to look up the
details.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
