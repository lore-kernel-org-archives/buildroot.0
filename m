From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Jul 2016 16:43:01 +0200
Subject: [Buildroot] [PATCH 00/24] Drop unused host packages
In-Reply-To: <CAHfJR7heFn1QsWoVSJB4kostyz9QTHVCKRNhgeerDBEx4tjVwQ@mail.gmail.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
 <20160629155233.510c456e@free-electrons.com>
 <77293ee3-6e4c-7342-214d-adffdde679f8@mind.be>
 <20160702123305.6bfbbc81@free-electrons.com>
 <87poqw8ege.fsf@dell.be.48ers.dk>
 <CAHfJR7heFn1QsWoVSJB4kostyz9QTHVCKRNhgeerDBEx4tjVwQ@mail.gmail.com>
Message-ID: <a950cc3d-5aef-1591-e014-b786a5eb6fa1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02-07-16 16:08, Julien Floret wrote:
> 2016-07-02 13:30 GMT+02:00 Peter Korsgaard <peter@korsgaard.com>:
>>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>>
>> Hi,
>>
>>  >> So, as the person who introduced this mis-feature, I'm the first one to vote
>>  >> for removing it again.
>>
>>  > I agree that this automatic derivation has caused quite a few issues in
>>  > the past and in many cases, we need different dependencies for the host
>>  > and the target variants. So maybe we should think of removing this
>>  > functionality.
>>
>> +1 from here as well.
> 
> Sounds good to me, I can take a look at this.

 Since that will be 64 patches, it may be a good idea to already submit just a
subset.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
