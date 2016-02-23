From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Feb 2016 21:46:28 +0100
Subject: [Buildroot] "The owner of buildroot.uclibc.org has configured
 their website improperly."
In-Reply-To: <87k2lv6u8z.fsf@dell.be.48ers.dk>
References: <CAF_dkJCBdH-p5Oa6TcKobVBR-ovT84jB64dE4mhy8ZaHV9UATQ@mail.gmail.com>
 <87k2lv6u8z.fsf@dell.be.48ers.dk>
Message-ID: <56CCC524.8020709@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/23/16 21:34, Peter Korsgaard wrote:
>>>>>> "Patrick" == Patrick Doyle <wpdster@gmail.com> writes:
> 
>  > I apologise if this has already been asked.
>  > When I try to connect to buildroot.uclibc.org with my ubuntu 14.04
>  > Firefox 44.0.2, I get the following message:
> 
>  > Your connection is not secure
>  > The owner of buildroot.uclibc.org has configured their website
>  > improperly. To protect your information from being stolen, Firefox has
>  > not connected to this website.
> 
>  > This site uses HTTP Strict Transport Security (HSTS) to specify that
>  > Firefox only connect to it securely. As a result, it is not possible
>  > to add an exception for this certificate.
> 
>  > I thought I should mention this, even though I'm sure I can't be the
>  > first to have noticed it.
> 
> First of all, buildroot.uclibc.org is the legacy name - Nowadays we have
> buildroot.{org,net}, so please use http://buildroot.org instead.
> 
> Secondly, the reason why you get this error is that the uClibc
> developers have recently added HSTS for *.uclibc.org (which forces
> https:// access), and the certificate we use for Buildroot doesn't list
> the legacy buildroot.uclibc.org address.

 The fix could be that the webserver is configured to redirect
buildroot.uclibc.org to buildroot.org, instead of serving it directly.

 Regards,
 Arnout

> 
> I'll try to get that fixed, but please move to the official address
> instead, which we've had for ~5 years or so by now.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
