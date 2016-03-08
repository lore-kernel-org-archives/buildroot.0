From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Mar 2016 18:38:05 +0100
Subject: [Buildroot] [Bug 8771] make savedefconfig modifies sources
In-Reply-To: <CAJJ6jxsZrveK6ziC0pPng+aTSuB4z=puUdMv5jjViM3aLfFNdw@mail.gmail.com>
References: <bug-8771-163@https.bugs.busybox.net/>
 <bug-8771-163-YmX2Br27g5@https.bugs.busybox.net/> <56DE1142.6080201@mind.be>
 <20160308090651.293fd95e@free-electrons.com>
 <CAJJ6jxsZrveK6ziC0pPng+aTSuB4z=puUdMv5jjViM3aLfFNdw@mail.gmail.com>
Message-ID: <56DF0DFD.1000707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/08/16 18:01, Steve Calfee wrote:
> Personally I find the maintenance of output/.br_external as more
> bizarre and confusing. It does allow me to not have to remember to set
> BR2_EXTERNAL when make is invoked, but it gets cleaned on make clean.

  That _is_ a bug IMHO. output/.br_external shouldn't be removed on 'make 
clean'. However, AFAICS it shouldn't be cleaned, only by distclean, and there it 
is appropriate of course.

  Regards,
  Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
