From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 09 Nov 2012 10:22:59 +0100
Subject: [Buildroot] [PATCH] perl: build with perlcross instead of qemu
In-Reply-To: <20121109101810.6f61c6a9@skate>
References: <1352425626-10628-1-git-send-email-arnout@mind.be>
 <878vab8cr8.fsf@dell.be.48ers.dk>
 <CABtOAfzb9n8HQ9Xbk1+1KnmTh7hHyxiQvD_7vPw5afs3YDyZMg@mail.gmail.com>
 <509CC99A.4010700@mind.be> <20121109101810.6f61c6a9@skate>
Message-ID: <509CCB73.7080106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/09/12 10:18, Thomas Petazzoni wrote:
>
> On Fri, 09 Nov 2012 10:15:06 +0100, Arnout Vandecappelle wrote:
>
>>    Doesn't make sense.  perlcross has to be extracted over the perl source: it
>> replaces a few configuration scripts and creates a few more.  There is nothing
>> in there to install on the host or on the target.
>
> First of all, thanks a lot for doing this work.
>
> Do you have details on how perl-cross is maintained with regard to
> perl? I.e, is it kept reasonably updated with new perl versions, or is
> it a hack that works on a single perl version that will force us to
> stay with only this version of perl?

  There are about 12 versions on the download site, one per major perl.  I guess
it doesn't make much difference which perl patchlevel it is applied to (this one
is actually for perl-5.16.0 but it work fine on our perl-5.16.1).

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
