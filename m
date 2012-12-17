From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Dec 2012 23:18:11 +0100
Subject: [Buildroot] [PATCH] netatalk : Fix BerkeleyDB library path
In-Reply-To: <CAGduivzm4RUMxoUWtsQshupg5Q=OFU3BYaXAOpp8CRVxghQYtA@mail.gmail.com>
References: <CAGduivwRviPJr6p6ypTZn4U-nDX4HQxXOPYE2s7=zzPZPYozjw@mail.gmail.com>
 <1354981988-32415-1-git-send-email-maxime.hadjinlian@gmail.com>
 <87pq29bq11.fsf@dell.be.48ers.dk>
 <CAGduivyvZNaaC8jdLzt1yVju3DS0Vu0fdaQYdHzK6LoRE==nYw@mail.gmail.com>
 <50CF8203.1010601@mind.be>
 <CAGduivzGSNwizLx8WbC+BN6J=dbmcDRjNyB7zc0stccS3X1BoQ@mail.gmail.com>
 <50CF9728.7050806@mind.be>
 <CAGduivzm4RUMxoUWtsQshupg5Q=OFU3BYaXAOpp8CRVxghQYtA@mail.gmail.com>
Message-ID: <50CF9A23.4090409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/12/12 23:13, Maxime Hadjinlian wrote:
> On Mon, Dec 17, 2012 at 11:05 PM, Arnout Vandecappelle<arnout@mind.be>  wrote:
[snip]
>>   Yes, but the configure script already does that: if it fails to find it in
>> $atalk_libname and $atalk_libname != lib then it tries again in lib.
> Okay, I see what I missed and I'm looking at your patch, I'll go to
> bed less stupid.

  The only reason I'm less stupid is that I spent three hours looking at 
that configure script...

  Regards,
  Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
