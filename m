From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 02 May 2015 01:06:04 +0200
Subject: [Buildroot] [PATCH v2 1/3] php: fpm sapi: install startup script
In-Reply-To: <5544050E.6020502@je-eigen-domein.nl>
References: <1430503955-24928-1-git-send-email-bos@je-eigen-domein.nl>
 <1430503955-24928-2-git-send-email-bos@je-eigen-domein.nl>
 <5543FF93.4080200@mind.be> <5544050E.6020502@je-eigen-domein.nl>
Message-ID: <554406DC.7000809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/05/15 00:58, Floris Bos wrote:
> Hi,
> 
> On 05/02/2015 12:34 AM, Arnout Vandecappelle wrote:
>> +- Expand file paths.
>> +- Remove obsolete After=syslog.target. Syslog is socket activated nowadays.
>>   Well, we do have a unit file for rsyslogd...
> 
> Other distros consider it obsolete, and told their maintainers to remove
> syslog.target last year.
> 
> http://lists.opensuse.org/archive/opensuse-packaging/2013-05/msg00102.html
> https://lintian.debian.org/tags/systemd-service-file-refers-to-obsolete-target.html

 Ah OK I get it now.


 Thanks,
 Arnout

> 
>>   Will you submit this patch upstream?
> 
> Did submit a simple pull request to php-src github earlier today.
> But do not plan to chase it.
> 
> 
> Yours sincerely,
> 
> Floris Bos
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
