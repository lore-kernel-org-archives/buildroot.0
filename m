From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 16 Jan 2016 22:18:11 +0100
Subject: [Buildroot] [PATCH] support/scripts: add size-stats-compare
 script
In-Reply-To: <20160116135112.52d70412@free-electrons.com>
References: <1452872492-6980-1-git-send-email-patrickdepinguin@gmail.com>
 <56998EA7.5020603@mind.be> <20160116135112.52d70412@free-electrons.com>
Message-ID: <569AB393.3010403@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16-01-16 13:51, Thomas Petazzoni wrote:
> Arnout,
> 
> On Sat, 16 Jan 2016 01:28:23 +0100, Arnout Vandecappelle wrote:
> 
>>  I think you should also add a reference to the script to
>> docs/manual/common-usage.txt. No full documentation is needed, you can just
>> point to the --help option (otherwise it would just get out of sync).
> 
> Agreed.
> 
> 
>>> +# This code relies on the output CSV files of 'make graph-size'. If you
>>> +# are comparing to an older Buildroot release, you can consider backporting
>>> +# that feature. See commits:
>>> +#    99aca138c20e1259ac8c23252c223e150d460482 (instrumentation hook)
>>> +#    598c80be8fc7b5ddfcba6f7715d90757033723ef (size-stats script)
>>> +#    24c75fbb38ffeb5c5a7278cf40f4f7cf867502e0 (make graph-size)
>>
>>  I think this documentation should be part of the argparse description.
> 
> I tend to disagree here, and instead who advocate to not have such
> documentation at all. Nowhere do we document which commits should be
> backported to bring this or that feature to an older Buildroot release,
> and I don't think we should start doing this.

 OK, I actually meant that the documentation should be part of the description,
I tend to agree that it's not necessary to tell people what to backport.

 Regards,
 Arnout

> 
> Best regards,
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
