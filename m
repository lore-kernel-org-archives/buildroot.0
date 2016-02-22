From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 22 Feb 2016 15:24:06 +0100
Subject: [Buildroot] [PATCH 4/4] docs/manual/contribute.txt: add
 formatting patches section
In-Reply-To: <56B8A738.6010602@mind.be>
References: <1454348717-4711-1-git-send-email-arnout@mind.be>
 <1454348717-4711-5-git-send-email-arnout@mind.be>
 <CAGm1_kv+suYiJPKwhwQ4jYPq8KuGMBQRhWH5uGfh53KXzAbQSg@mail.gmail.com>
 <56B8A738.6010602@mind.be>
Message-ID: <CAGm1_ksvQJODDuib=d-rCtqy4Q3Xy5-+a6VcmjbAxFwF-nvp3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 8, 2016 at 3:33 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 08-02-16 11:48, Yegor Yefremov wrote:
>> On Mon, Feb 1, 2016 at 6:45 PM, Arnout Vandecappelle (Essensium/Mind)
>> <arnout@mind.be> wrote:
>
> [snip]
>>> +The summary line should be something like +<packagename>: bump to version <new
>>> +  version>+.
>>
>> For now bump message looks so:
>>
>> packagename: bump to <new version>
>>
>> should we keep it this way, i.e. without the word "version"?
>
>  Since 2015.02, we have:
>
>  89 times '<pkg>: bump version'
> 382 times '<pkg>: bump version to ...'
> 816 times '<pkg>: bump to version ...'

OK. Then I'll change to the new scheme :-)

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
