From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Jan 2016 02:23:29 +0100
Subject: [Buildroot] [PATCH 38/84 RFC] docs/manual: add example about
 sub-options
In-Reply-To: <20151231172653.GF3495@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <d74a1da746237dff8a24373d5f561853bcc6b175.1451076704.git.yann.morin.1998@free.fr>
 <5684740D.3060107@mind.be> <20151231172653.GF3495@free.fr>
Message-ID: <56872691.6050507@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31-12-15 18:26, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2015-12-31 01:17 +0100, Arnout Vandecappelle spake thusly:
>> On 25-12-15 22:25, Yann E. MORIN wrote:
>>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>> ---
>>>  docs/manual/adding-packages-directory.txt | 25 +++++++++++++++++++++++++
>>>  1 file changed, 25 insertions(+)
>>>
>>> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
>>> index faf967c..2b9e714 100644
>>> --- a/docs/manual/adding-packages-directory.txt
>>> +++ b/docs/manual/adding-packages-directory.txt
>>> @@ -54,6 +54,31 @@ examples in other packages. The syntax of the +Config.in+ file is the same
>>>  as the one for the kernel Kconfig file. The documentation for this syntax is
>>>  available at http://kernel.org/doc/Documentation/kbuild/kconfig-language.txt[]
>>>  
>>> +For example:
>>> +
>>> +---------------------------
>>> +config BR2_PACKAGE_LIBFOO
>>> +	bool "libfoo"
>>> +	help
>>> +	  This is a comment that explains what libfoo is.
>>> +
>>> +	  http://foosoftware.org/libfoo/
>>> +
>>> +if BR2_PACKAGE_LIBFOO
>>> +
>>> +config BR2_PACKAGE_LIBFOO_BAR
>>> +	bool "bar support"
>>> +	help
>>> +	  This is a comment that briefly explains what
>>> +	  bar support is, if it's not obvious.
>>
>>  This should be indented at 72 columns like we require in the real Config.in.
> 
> Yes, but in this case, the second line is really short, and in that case
> I prefer (and usually tend to use) a shorter first line so the second
> line is more than one or two words, it looks easier to read to me...

 Well, this is the manual, we're setting the example here, so not sticking to
the rule would be confusing IMHO.

 Regards,
 Arnout

> 
> But I don't feel strongly about it either. I'll fix.
> 
> Regards,
> Yann E. MORIN.
> 
>>  Regards,
>>  Arnout
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
