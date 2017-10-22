From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Oct 2017 12:46:09 +0200
Subject: [Buildroot] [V3 3/3] prosody: tweak configuration
In-Reply-To: <20171022123832.00d3543b@windsurf>
References: <20171022071716.792-1-francois.perrad@gadz.org>
 <20171022071716.792-3-francois.perrad@gadz.org>
 <20171022123832.00d3543b@windsurf>
Message-ID: <81a0cc50-e71b-7610-5728-24a69527ef25@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-10-17 12:38, Thomas Petazzoni wrote:
> Hello,
> 
> 
>> diff --git a/package/prosody/0001-enable-syslog.patch b/package/prosody/0001-enable-syslog.patch
>> new file mode 100644
>> index 000000000..af67f0f03
>> --- /dev/null
>> +++ b/package/prosody/0001-enable-syslog.patch
>> @@ -0,0 +1,22 @@
>> +enable syslog
>> +
>> +note: the posix module is auto-loaded by default
>> +
>> +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> 
> It would be nicer to have Git formatted patches, you can use their Git
> mirror at https://github.com/bjc/prosody.

 Also you Sob is missing in the second patch.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
