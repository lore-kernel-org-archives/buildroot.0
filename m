From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 4 Nov 2017 23:07:01 +0100
Subject: [Buildroot] [PATCH 1/2] dhcpcd: add SysV start-up script
In-Reply-To: <20171104230331.7ee309cb@windsurf>
References: <20171031223659.6831-1-code@mmayer.net>
 <20171031223659.6831-2-code@mmayer.net> <20171102230602.3c61e8d2@windsurf>
 <20171102221847.GA23314@scaer> <20171102232345.5a434af8@windsurf>
 <3f7fff7b-be5a-42ff-985f-0e860c98acb3@mind.be>
 <20171104230331.7ee309cb@windsurf>
Message-ID: <7c1fde5e-099e-7a22-4b13-4ac9e81f3d87@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-11-17 23:03, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 4 Nov 2017 20:56:55 +0100, Arnout Vandecappelle wrote:
> 
>>  I vaguely remember a recently added package where the daemon would silently
>> fail to start if the config file is missing, and which doesn't even have a
>> default config file. So I think checking for existence of the config file in the
>> init script (if the config file is mandatory) makes sense.
> 
> So I suppose your suggestion is that the init script should abort with
> a failure if the configuration file doesn't exist. Correct?

 Exactly. "Failure" anyway just means an error message on the console, not that
the system fails to boot.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
