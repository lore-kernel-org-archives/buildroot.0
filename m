From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 7 Sep 2019 21:13:16 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-09-01
In-Reply-To: <20190907135036.1de67005@windsurf>
References: <5d6cb406.1c69fb81.71217.d243SMTPIN_ADDED_MISSING@mx.google.com>
 <CAFOYHZA-v1OeAoWcN1tZr6eF7oD5pD7rTMpCcnL2dtN6nwOu4w@mail.gmail.com>
 <20190905092419.2a23fe05@windsurf>
 <84828989-ee8d-36ff-a7c0-a1ef61d447bd@mind.be>
 <20190907135036.1de67005@windsurf>
Message-ID: <d06b9b23-8fe4-534b-d79b-dd39f58e0e9d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/09/2019 13:50, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 7 Sep 2019 13:24:47 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>> However, for eventlog, how does one know about new versions ? The
>>> Github repo at https://github.com/balabit/eventlog doesn't have any
>>> tags, and the HTTP URL https://my.balabit.com/downloads/eventlog/ that
>>> we use in eventlog.mk does not have listing enabled. So, there doesn't
>>> seem to be a useful way for release-monitoring.org to detect the new
>>> versions available.  
>>
>>  There's https://github.com/balabit/eventlog/blob/master/VERSION - can
>> release-monitoring use that?
> 
> Yes, it can, and I changed eventlog accordingly:
> 
>   https://release-monitoring.org/project/14684/
> 
> The drawback with this is that it will only know about one version at a
> time, contrary to a list of git tags or a list of tarballs.

 AFAIU, release-monitoring regularly polls and will keep anything it ever
received. So only if there are two updates between the pols, a version could be
missed.

> Also, for now release-monotoring.org still remembers about the invalid
> versions from syslog-ng. I'll report this issue.

 That's pretty annoying, since the syslog-ng version is higher...

 Regards,
 Arnout
