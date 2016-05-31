From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 31 May 2016 15:50:27 +0200
Subject: [Buildroot] [PATCH] Config.in: wrap to column width 72
In-Reply-To: <5748D351.9060302@surround.io>
References: <1464298507-22817-1-git-send-email-martin@surround.io>
 <20160527230450.10a646c2@free-electrons.com> <5748D351.9060302@surround.io>
Message-ID: <443ebf98-5140-d57e-5636-7d4491589f7e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/28/16 01:08, Martin Kelly wrote:
> On 05/27/2016 02:04 PM, Thomas Petazzoni wrote:
>> Hello,
>>
>> Thanks for this patch. Looks good, except for one thing.
>>
>> On Thu, 26 May 2016 14:35:07 -0700, Martin Kelly wrote:
>>
>>> +      Command to be used to extract a gzip'ed file to stdout.  zcat
>>
>> Why do you have two spaces after the . here ? Only one is enough.
>>
>> There are other occurrences of the same issue in the rest of the patch.
>> Could you fix this and send an updated version?
>>
> 
> Some of these cases are caused by my rewrapping accidentally adding a space.
> Other cases were already present prior to wrapping. For example:
> 
> -   Have a look on the kernel.org site for a list of mirrors, then enter
> -   the URL to the base directory.  Examples:
> +   Have a look on the kernel.org site for a list of mirrors, then
> +   enter the URL to the base directory.  Examples:
> 
> Would you like me to fix up all ".  " --> ". " as well, or just fix the newly
> introduced ".  " ? I'm happy to do either way.

 Either option is OK, but if you remove all double spaces it's even better.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
