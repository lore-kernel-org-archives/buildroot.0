From: Steve Calfee <stevecalfee@gmail.com>
Date: Tue, 8 Mar 2016 10:06:55 -0800
Subject: [Buildroot] [Bug 8771] make savedefconfig modifies sources
In-Reply-To: <56DF0DFD.1000707@mind.be>
References: <bug-8771-163@https.bugs.busybox.net/>
 <bug-8771-163-YmX2Br27g5@https.bugs.busybox.net/>
 <56DE1142.6080201@mind.be>
 <20160308090651.293fd95e@free-electrons.com>
 <CAJJ6jxsZrveK6ziC0pPng+aTSuB4z=puUdMv5jjViM3aLfFNdw@mail.gmail.com>
 <56DF0DFD.1000707@mind.be>
Message-ID: <CAJJ6jxsGOC4A4zooN1pfQrT4aRKRXKPeYLZOfQuEH7Tiv2dPmg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 8, 2016 at 9:38 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 03/08/16 18:01, Steve Calfee wrote:
>>
>> Personally I find the maintenance of output/.br_external as more
>> bizarre and confusing. It does allow me to not have to remember to set
>> BR2_EXTERNAL when make is invoked, but it gets cleaned on make clean.
>
>
>  That _is_ a bug IMHO. output/.br_external shouldn't be removed on 'make
> clean'. However, AFAICS it shouldn't be cleaned, only by distclean, and
> there it is appropriate of course.
>
>  Regards,
>  Arnout
>

Hi Arnout,

I just went back and tried and make clean does not clear the
.br_external I guess I was just confused when trying earlier (I am
still on 2015.11). Sorry about the noise, no bug.

Regards, Steve
