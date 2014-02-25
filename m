From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Feb 2014 22:38:13 +0100
Subject: [Buildroot] [PATCH 02/24] lua: refactor install steps
In-Reply-To: <CAB0FRsszkDtd1UVPmtEG+AEUW2uY6VrajFHE9K+X1C0efi3GDw@mail.gmail.com>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>	<1393227301-14874-3-git-send-email-francois.perrad@gadz.org>	<530CD566.7090305@mind.be>
 <CAB0FRsszkDtd1UVPmtEG+AEUW2uY6VrajFHE9K+X1C0efi3GDw@mail.gmail.com>
Message-ID: <530D0D45.7040303@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/02/14 22:07, Fran?ois Perrad wrote:
>> >
>> >  Not related to this patch, but it seems to me that the .so is built and
>> > installed unconditionally, even on BR2_PREFER_STATIC and BINFMT_FLAT. How
>> > can this even work?
> You are right. lua doesn't work with Blackfin.
> See http://patchwork.ozlabs.org/patch/314146/

 OK, I'll do a quick review of that patch.

 Could you make a series of the first two of these, together with an
update of 314146, to be included in 2014.02?


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
