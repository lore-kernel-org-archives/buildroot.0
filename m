From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Oct 2013 08:12:21 +0100
Subject: [Buildroot] [PATCH 1/1] python-pyusb: new package
In-Reply-To: <CAMduVEc4LUGPXPoNmQR0_+pYf9_Pd2BUeFQG0xrWZyScbHJNNw@mail.gmail.com>
References: <CAMduVEegwCNSu2cBGbTOjUhBUtD5kv1F14eViyj+y9M29wwngQ@mail.gmail.com>
 <1382742325-11435-1-git-send-email-wzab01@gmail.com>
 <OF7CA7B8E3.5FD89345-ON86257C0F.0052857B-86257C0F.0054D5D3@rockwellcollins.com>
 <1256826d-31b9-4b85-8834-35694e372fac@email.android.com>
 <1382742930-11510-1-git-send-email-wzab01@gmail.com>
 <526B018E.9080206@mind.be>
 <CAMduVEc4LUGPXPoNmQR0_+pYf9_Pd2BUeFQG0xrWZyScbHJNNw@mail.gmail.com>
Message-ID: <526E0E55.8060005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/10/13 09:33, Wojciech Zabolotny wrote:
> On Sat, Oct 26, 2013 at 1:41 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>>   Also, when sending an update, it is customary to add v2 to the subject so
>> people can see which version is the latest one. You can do that by calling
>> git send-email -v2 # Since git 1.8.x
>> or
>> git send-email --subject-prefix='PATCH v2'
>>
>
> It seems, that the above should be applied to git format-patch, not
> git send-email?

  You're right, but git send-email takes (almost) all of the options of 
git format-patch if you let it generate patches directly (e.g. with 'git 
send-email -1). Normally I don't bother with generating the patches 
separately and just mail them immediately - and I assumed that the rest 
of the world does the same :-).

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
