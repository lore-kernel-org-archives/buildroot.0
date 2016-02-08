From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 8 Feb 2016 15:33:28 +0100
Subject: [Buildroot] [PATCH 4/4] docs/manual/contribute.txt: add
 formatting patches section
In-Reply-To: <CAGm1_kv+suYiJPKwhwQ4jYPq8KuGMBQRhWH5uGfh53KXzAbQSg@mail.gmail.com>
References: <1454348717-4711-1-git-send-email-arnout@mind.be>
 <1454348717-4711-5-git-send-email-arnout@mind.be>
 <CAGm1_kv+suYiJPKwhwQ4jYPq8KuGMBQRhWH5uGfh53KXzAbQSg@mail.gmail.com>
Message-ID: <56B8A738.6010602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-02-16 11:48, Yegor Yefremov wrote:
> On Mon, Feb 1, 2016 at 6:45 PM, Arnout Vandecappelle (Essensium/Mind)
> <arnout@mind.be> wrote:

[snip]
>> +The summary line should be something like +<packagename>: bump to version <new
>> +  version>+.
> 
> For now bump message looks so:
> 
> packagename: bump to <new version>
> 
> should we keep it this way, i.e. without the word "version"?

 Since 2015.02, we have:

 89 times '<pkg>: bump version'
382 times '<pkg>: bump version to ...'
816 times '<pkg>: bump to version ...'


 Regards,
 Arnout

> 
>> +If the new version only contains security updates compared to the existing one,
>> +  the summary should be +<packagename>: security bump to version <new version>+
> 
> same here
> 
>> +  and the commit message body should show the CVE numbers that are fixed.
>> +If some package patches can be removed in the new version, it should be
>> +  explained explicitly why they can be removed, preferably with the upstream
>> +  commit ID.
>> +Also any other required changes should be explained explicitly, like configure
>> +  options that no longer exist or are no longer needed.
>> +
>> +
>>  ==== Preparing a patch series
>>
>>  Starting from the changes committed in your local git view, _rebase_ your
>> --
>> 2.7.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
