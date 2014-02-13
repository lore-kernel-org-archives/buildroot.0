From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 13 Feb 2014 10:15:04 +0100
Subject: [Buildroot] [pkg-perl infra V8 5/6] manual: adding packages perl
In-Reply-To: <52FC6608.5080609@mind.be>
References: <1392139307-29635-1-git-send-email-francois.perrad@gadz.org>
 <1392139307-29635-6-git-send-email-francois.perrad@gadz.org>
 <52FB1685.6030409@mind.be> <52FC6608.5080609@mind.be>
Message-ID: <CAB0FRsvC27Eu7oAJ47xA2_n4c_WN3aiG-73evr+dytBo5R279g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-02-13 7:28 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:
>  Hi Francois,
>
> On 12/02/14 07:36, Arnout Vandecappelle wrote:
>> On 11/02/14 18:21, Francois Perrad wrote:
>>> +Note that:
>>> +
>>> + * Setting +PERL_FOO_INSTALL_STAGING+ to +YES+ has no effect (unless
>>> +   a +PERL_FOO_INSTALL_STAGING_CMDS+ variable is defined), since
>>> +   Perl modules generally don't need to be installed to the
>>> +   +staging+ directory.
>>> +
>>
>>  With only one bullet point, the bullet list is pointless. Also I think
>> the formulation of the explanation is not very clear. I proposed this
>> alternative in reply to v6:
>>
>> Note that setting +PERL_FOO_INSTALL_STAGING+ to +YES+ has no effect
>> unless a +PERL_FOO_INSTALL_STAGING_CMDS+ variable is defined. The perl
>> infrastructure doesn't define these commands since Perl modules generally
>> don't need to be installed to the +staging+ directory.
>
>  Did you miss this mail? I didn't see this changed in v9.
>

I see it but after sending V9. Applied in V10.

Fran?ois.

>  Maybe you just disagree with what I say here, but then please say so
> explicitly.
>
>  Regards,
>  Arnout
>
>>
>>
>>  Otherwise, looks good to me.
>>
>>  Regards,
>>  Arnout
>>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
